<?php

namespace App\Http\Controllers;

use App\Models\Bet;
use App\Models\Livestream;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\Foundation\Application;

class MyStreamsController extends Controller
{
    public function index()
    {

        // user
        $user = auth()->user();


//   $streams = DB::table("livestreams") 
// 		 ->select("livestreams.*", 
// 		                     DB::raw("( select sum( bet_main.streamer_fee)  from bet_main    where bet_main.livestream_id =  livestreams.id  ) as streamer_fee"),
// 		                     DB::raw("( select sum( bets.vig_amount)  from bets    where bets.game_id =  livestreams.id  ) as vig_amount"))
			
// 			->where('user_id', $user->id)->paginate(10);  
	    $uId = $user->id;
       
        $streams = Livestream::whereHas('bets',function($query) use( $uId){
            $query->where('user_id',$uId);
        },'betMain',function($query) use( $uId){
            $query->where('user_id',$uId);
        })->where('user_id', $user->id)->orderBy('id', 'desc')->paginate(10); 
        return view('my_streams.index', compact('streams'));

    }


public function getMyStreamBettingList($id){ 
$game_info =Livestream::where('id', $id)->first();
		  $records = Bet::with('betmain')->where('game_id', $id)->orderBy('id', 'desc')->paginate(10);  
			return view('MyStreamBets.index',  ['records' => $records ,'game_info'=>$game_info  ]);
}


public function GetMyStreams(Request $request)
{
    try {
        // Authenticate the user
        $user = auth()->user();
        if (!$user) {
            return response()->json(['status' => 'error', 'message' => 'Unauthorized'], 401);
        }

        $uId = $user->id;

        // Query streams related to the authenticated user along with additional information
        $streams = Livestream::with(['bets', 'betMain'])
            ->where('user_id', $user->id)
            ->orderBy('id', 'desc')
            ->paginate(10);

        // Transform the result to include additional information
        $transformedStreams = $streams->map(function ($stream) {
            return [
                'Stream Name' => $stream->name,
                'Started Date' => $stream->created_at->format('Y-m-d H:i:s'), // Adjust date format as needed
                'End Date' => $stream->end_date ?? 'N/A', // Assuming 'end_date' is available for the stream
                'Vig Amount' => $stream->bets->sum('vig_amount'),
                'Streamer Fees' => $stream->betMain->sum('streamer_fee')
            ];
        });

        // Return success response with transformed streams data
        return response()->json(['status' => 'success', 'streams' => $transformedStreams]);

    } catch (\Exception $e) {
        // Log the exception
        \Log::error('Error fetching user streams: ' . $e->getMessage());

        // Return error response
        return response()->json(['status' => 'error', 'message' => 'Failed to fetch user streams.'], 500);
    }
}

    public function GetMyBettings(Request $request)
    {
        try {
            // Authenticate the user
            $user = auth()->user();
            if (!$user) {
                return response()->json(['status' => 'error', 'message' => 'Unauthorized'], 401);
            }
    
            // Query streams related to the authenticated user along with additional information
            $streams = Livestream::with(['bets' => function ($query) {
                $query->with(['betmain', 'user'])
                    ->orderBy('created_at', 'desc')
                    ->get();
            }])
                ->where('user_id', $user->id)
                ->orderBy('id', 'desc')
                ->get();
    
            // Transform the result to include desired information
            $transformedStreams = $streams->map(function ($stream) {
                return [
                    'Stream Name' => $stream->name,
                    'Started On' => $stream->created_at->format('Y-m-d H:i:s'),
                    'Bets' => $stream->bets->map(function ($bet) {
                        return [
                            'Bet Description For Text' => $bet->description,
                            'Against Text' => $bet->against_text,
                            'Bet On' => $bet->bet_on,
                            'Bet Amount' => $bet->bet_amount,
                            'Vig Amount' => $bet->vig_amount,
                            'Won Amount' => $bet->won_amount,
                            'Status' => $bet->status,
                            'Bet Date' => $bet->created_at->format('Y-m-d H:i:s'),
                        ];
                    }),
                ];
            });
    
            // Return success response with transformed streams data
            return response()->json(['status' => 'success', 'streams' => $transformedStreams ,'message'=>"My stream details retrive successfuly."]);
    
        } catch (\Exception $e) {
            // Log the exception
            Log::error('Error fetching user streams: ' . $e->getMessage());
    
            // Return error response
            return response()->json(['status' => 'error', 'message' => 'Failed to fetch user streams.'], 500);
        }
    }

}
