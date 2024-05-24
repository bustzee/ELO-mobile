<?php

namespace App\Http\Controllers\LiveStream;

use Image;
use Route;
use Session;
use App\Models\Bet;
use App\Models\Users;
use App\Models\BetMain;
use App\Models\Betting;
use App\Models\Setting;
use App\Models\GameRoom;
use App\Models\UserRoom;
use App\Models\GameLabel;
use App\Models\SpamWords;
use App\Models\UserLabel;
use App\Models\Livestream;
use Illuminate\Support\Str;
use App\Models\StreamReport;
use Illuminate\Http\Request;
use App\Models\StreamDispute;
use Termwind\Components\Span;

use App\Events\ChatDelayEvent;
use App\Models\LivestreamLike;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;


class LiveStreamController extends Controller
{


   
    // accept stream
    public function onPublish(Request $request)
    {

        $streamId = $request->name;
        $livestream = Livestream::where('stream_id', $streamId)
            ->first();

        // start live stream
        if ($livestream) {

            // check is stopped
            if ($livestream->status == "stopped") {
                return response('No', 400)->header('Content-Type', 'text/plain');
            }

            // start
            $livestream->status = 'started';
            $livestream->save();
            return response('Good', 200)->header('Content-Type', 'text/plain');
        }

        return response('No', 400)->header('Content-Type', 'text/plain');

    }

    // start stream form
    public function showStartStreamForm(Request $request)
    {

//        $email = Session::get('userid');
//        $user = Users::where('Email', $email)->first();

        $user = auth()->user();

        if (!$user) {
            return redirect('/login');
        }

        // has any stream
        $livestream = Livestream::where('user_id', $user->id)
            ->whereIn('status', ['created', 'started'])
            ->first();

        return view('live.start_stream_form', compact('livestream'));

    }

    // start stream form
    public function createNewStream(Request $request)
    {

        // image validation
        $this->validate($request, [
            'image' => ['required', 'dimensions:min_width=1200,min_height=700', 'max:5120'],
            'description'=>['required']
        ]);

//        $email = Session::get('userid');
//        $user = Users::where('Email', $email)->first();

        $user = auth()->user();

        if (!$user) {
            return redirect('/login');
        }

        // $imageName = time() . '.' . $request->image->extension();
        // $request->image->move(public_path('images'), $imageName);
        // $input['file'] = time().'.'.$image->getClientOriginalExtension();
		
		
		
		
		
        $image = $request->file('image');
        $input['file'] = time().'.'.$image->getClientOriginalExtension();
        
        $destinationPath = public_path('/thumbnail');
        $imgFile = Image::make($image->getRealPath());
        $imgFile->resize(370, 220, function ($constraint) {
		    $constraint->aspectRatio();
		})->save($destinationPath.'/'.$input['file']);
        $destinationPath = public_path('/images');
        $image->move($destinationPath, $input['file']);
        

        // has any stream[]
        $livestream = new Livestream();
        $livestream->user_id = $user->id;
        $livestream->name = $request->name;
        $livestream->description = $request->description;
        $livestream->image =  $input['file'];
        //$livestream->stream_id = Str::replace("-", "", Str::orderedUuid());
		$livestream->stream_id =$user->stream_key;
        $livestream->status = "created";
        $livestream->save();

        // return to form
        return redirect()->route('stream.form.index');

    }


    public function CreateStream(Request $request)
    {
        try {
            // Validate incoming request data
            $validator = Validator::make($request->all(), [
                'image' => ['required', 'string'],
                'description' => ['required', 'string'],
                // You might need to adjust the validation rules based on your requirements
            ]);
    
            if ($validator->fails()) {
                return response()->json(['status' => 'error', 'message' => $validator->errors()->first()], 400);
            }
    
            // Authenticate the user
            $user = auth()->user();
            if (!$user) {
                return response()->json(['status' => 'error', 'message' => 'Unauthorized'], 401);
            }
    
            // Process the base64 encoded image
            $imageData = $request->input('image');
            $imageData = str_replace('data:image/png;base64,', '', $imageData);
            $imageData = str_replace('data:image/jpeg;base64,', '', $imageData);
            $imageData = str_replace(' ', '+', $imageData);
            $image = base64_decode($imageData);
            $extension = 'png'; // Default extension
            if (Str::contains($request->input('image'), 'jpeg')) {
                $extension = 'jpg';
            }
            $imageName = Str::random(10) . '.' . $extension;
    
            // Save the image to the server
            file_put_contents(public_path('images') . '/' . $imageName, $image);
    
            // Create the stream
            $livestream = new Livestream();
            $livestream->user_id = $user->id;
            $livestream->name = $request->name; // Ensure 'name' is sent in the request
            $livestream->description = $request->description;
            $livestream->image = $imageName;
            $livestream->stream_id = $user->stream_key; // Assuming stream_key is available for the user
            $livestream->status = "created";
            $livestream->save();
    
            // Return success response
            return response()->json(['status' => 'success', 'message' => 'Stream created successfully', 'stream' => $livestream]);
    
        } catch (\Exception $e) {
            // Log the exception
            Log::error('Error creating stream: ' . $e->getMessage());
    
            // Return error response
            return response()->json(['status' => 'error', 'message' => 'Failed to create stream.'], 500);
        }
    }

    // stop stream form
    public function stopStream(Request $request)
    {

       // dd($request->all());
//        $email = Session::get('userid');
//        $user = Users::where('Email', $email)->first();

        $user = auth()->user();

        if (!$user) {
            return redirect('/login');
        }
		
		$is_addedd_data =Livestream::where('id', $request->stream_id)
            ->first();
			
		if($is_addedd_data){
			
			$stream_id_new=$is_addedd_data->stream_key.'1';
			Livestream::where('id', $is_addedd_data->id)
			   ->update([
				   'stream_id' => $stream_id_new
				]);
			
		}
		

        // has any stream
        $livestream = Livestream::where('id', $request->stream_id)
          //  ->whereIn('status', ['created', 'started'])
            ->first();

        // check is user authenticated
       //dd($livestream->user_id,$user-id);
        if ($livestream->user_id != $user->id) {
            return abort('403');
        }

        // stop if exists
        if ($livestream) {
            $livestream->status = "stopped";
            $livestream->save();
            broadcast(new ChatDelayEvent($livestream));
        }
        

        // return to form
        return redirect()->route('stream.form.index');

    }

    // live stream
    public function showStream(Request $request, $id)
    {
        $livestream = Livestream::where('id', $id)->first();
        $pot_amount = Bet::where('game_id', $livestream->id)->sum('amount');
        $setting = Setting::find(1);
        $game_name = "";
        $player_stats = null;
        $game_id = $livestream ? $livestream->id : 0;
        $betting_masters = Betting::where('is_active', 1)->orderBy('betting_amount', 'asc')->get();
        $conversion = \DB::table('conversion')->first();
        $count_label = 0;
        $chk_label = '';
        $count_bet = 0;
        $user_room_names = '';
        $current_room_names = '';
        $rm_name = '';
        $is_user_betted = false;
        $like_count = 0;
        $email = auth()->check() ? auth()->user()->id : 0;
        if (auth()->check()) {
            $user_id = auth()->id();
            $count_label = UserLabel::where('user_id', $user_id)->count();
            $chk_label = UserLabel::where('user_id', $user_id)->get();
            $l_name = GameLabel::with('userlabel')->where('user_id', $user_id)
                ->where('game_id',  $livestream->id)->first();
            if ($l_name) {
                $label_name = $l_name->userlabel->label_game;
            }
            if (Bet::where('user_id', $user_id)->count() > 0) {
                $chk_first_bet = Bet::select('user_id', 'id', 'game_id')->where('game_id', $game_id)->orderBy('id', 'asc')->limit(1)->first();
                $bet_user_id = $chk_first_bet != '' ? $chk_first_bet->user_id : 'empty';
                if ($bet_user_id == $user_id) {
                    $count_game_room = GameRoom::select('user_id', 'game_id')->where('user_id', $user_id)
                        ->where('game_id',    $livestream->id)->count();
                    if ($count_game_room > 0) {
                        $user_room_names = UserRoom::select('id', 'room_name', 'user_id')->where('user_id', $user_id)->get();
                        $current_room_names = GameRoom::where('user_id', $user_id)->where('game_id', $livestream->id)->latest()->first();
                        $count_bet = 1;
                    } else {
                        $count_user_room_names = UserRoom::select('id', 'room_name', 'user_id')->where('user_id', $user_id)->count();
                        if ($count_user_room_names > 0) {
                            $user_room_names = UserRoom::select('id', 'room_name', 'user_id')->where('user_id', $user_id)->get();
                            $count_bet = 4;
                        } else {
                            $count_bet = 2;
                        }
                    }
                } else {
                    $r = GameRoom::with('game_room')->select('room_id', 'user_id')->where('game_id', $livestream->id)->first();
                    if ($r != '') {
                        $rm_name = $r->game_room->room_name;
                        $count_bet = 3;
                    } else {
                        $count_bet = 0;
                    }
                }
            } else {
                $r = GameRoom::with('game_room')->select('room_id', 'user_id')->where('game_id', $livestream->id)->first();
                if ($r != '') {
                    $rm_name = $r->game_room->room_name;
                    $count_bet = 3;
                } else {
                    $count_bet = 0;
                }
            }
            $active_bets = BetMain::with(['master', 'user', 'bets'])
                ->select("bet_main.*",
                    DB::raw("( select count(bets.id)  from bets  where bets.bet_main_id =  bet_main.id) as total"),
                    DB::raw("( select count(bets.id)  from bets  where bets.bet_main_id =  bet_main.id and user_id = '".auth()->id()."' ) as is_add_bet"),
                    DB::raw("( select count(bets.id)  from bets  where bets.bet_main_id =  bet_main.id and user_id = '".auth()->id()."' AND is_claimed  = 1  ) as is_claim_bet")
                )
                ->where('livestream_id', $game_id)->orderBy('created_at', 'desc')->get();

            
            foreach ($active_bets as $bet) {
                if ($bet->user_id === auth()->id()) {
                    $is_user_betted = true;
                    break; // Break both loops once the user's bet is found
                }
            }
            

            $like_count = LivestreamLike::count();

            $viewer = $livestream->viewer()->where('users_id', auth()->user()->id)->first();
            if (!$viewer && auth()->check()) {
                $livestream->viewer()->attach(auth()->user()->id);
            }
                
        } else {
            $r = GameRoom::with('game_room')->select('room_id', 'user_id')->where('game_id', $game_id)->first();
            if ($r != '') {
                $rm_name = $r->game_room->room_name;
                $count_bet = 3;
            } else {
                $count_bet = 0;
            }
        }
        
        return view('live.show_stream',
            ['livestream' => $livestream, 'pot_amount' => $pot_amount, 'setting' => $setting, 'game_name' => $game_name, 'player_stats' => $player_stats, 'active_bets' => $active_bets ?? null, 'betting_masters' => $betting_masters, 'conversion' => $conversion, 'count_label' => $count_label, 'chk_label' => $chk_label, 'label_name' => $label_name ?? null, 'l_name' => $l_name ?? null, 'count_bet' => $count_bet, 'email' => $email, 'user_room_names' => $user_room_names, 'current_room_names' => $current_room_names, 'rm_name' => $rm_name,'is_user_betted' => $is_user_betted,'like_count' => $like_count]);
    }


    

    public function filtes(){
        $filters = SpamWords::pluck('name')->toArray();

        return response()->json(['data'=> $filters],200);
    }
    public function delayTime(Request $request){
        $livestream = Livestream::find($request->id);
        if( $livestream){
            tap($livestream->update(['delay_time'=>$request->time]));
            broadcast(new ChatDelayEvent($livestream));
        }
        return response()->json(['success'=>true]);
    }

    public function onrmptStop(Request $request){

        // \Log::info("live stream stop from rmpt is working fine!");
        // \Log::info($request->all());
        \Log::info($request->name);
        $streamId = $request->name;
        $livestream = Livestream::where('stream_id', $streamId)
            ->first(); 
		 
			
            \Log::info( $livestream);
            if ($livestream) { 
				$stream_id_new=$livestream->stream_id.'1';
				
                tap($livestream)->update(['status'=> "stopped" , 'stream_id' => $stream_id_new]);
                \Log::info( $livestream);
                broadcast(new ChatDelayEvent($livestream));
    
            return response('Good', 200)->header('Content-Type', 'text/plain');
        }

        return response('No', 400)->header('Content-Type', 'text/plain');

    }

	public function renameStreamApi(Request $request){
		$streamId = $request->name;  
		$livestream = Livestream::where('stream_id', $streamId) ->first();
		 
		if($livestream) {
			return response()->json(['new_name'=> $livestream->id,'name'=> $streamId],200);
			  
		}else{
			
			$streamId = $request->name;  
			$streamIdn = $request->name.'1';  
			$livestreamn = Livestream::orderBy('id','desc')->where('stream_id', $streamIdn) ->first();
			if($livestreamn) {
				return response()->json(['new_name'=> $livestreamn->id,'name'=> $streamId],200);
			  
			}else{	
			
			 return response()->json([],400); 
			}
		}
		 
	}

    public function saveStreamReport(Request $request){
        
        // Validate the request data
        $request->validate([
            // 'stream_id' => 'required|exists:livestreams,id',
            'stream_id' => 'required|string',
            'stream_type' => 'required|string',
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'mobile' => 'required|string|max:15', // Adjust max length as needed
            'report_for' => 'required', // Adjust max length as needed
            'remark' => 'required|string|max:255', // Optional field

        ]);

        
        // Check if the live stream exists
        $streamExists = Livestream::where('id', $request->input('stream_id'))->exists();

        if (!$streamExists) {
            // Stream not found, return response
            return response()->json(['message' => 'Stream not found'], 404);
        }

        // Store the report in the database
        $report = new StreamReport();
        $report->stream_id = $request->input('stream_id');
        $report->stream_type = $request->input('stream_type');
        $report->name = $request->input('name');
        $report->stream_name = $request->input('stream_name');
        $report->email = $request->input('email');
        $report->mobile = $request->input('mobile');
        $report->remark = $request->input('remark');

        $report->save();

        // Report stored successfully, return success response
        return response()->json(['message' => 'Report submitted successfully'], 200);
         
    }

    public function saveStreamDispute(Request $request){
        
        // Validate the request data
        $request->validate([
            'stream_id' => 'required|exists:livestreams,id',
            'remark' => 'required|string|max:255', // Optional field
        ]);

        
        // Check if the live stream exists
        $streamExists = Livestream::where('id', $request->input('stream_id'))->exists();

        if (!$streamExists) {
            // Stream not found, return response
            return response()->json(['message' => 'Stream not found'], 404);
        }

        // Store the report in the database
        $dispute = new StreamDispute();
        $dispute->stream_id = $request->input('stream_id');
        $dispute->user_id = auth()->user()->id;
        $dispute->bet_id =  $request->input('bet_id');
        $dispute->dispute_for =  $request->input('dispute_for');
        
        $dispute->remark = $request->input('remark');
        $dispute->save();

        // Report stored successfully, return success response
        return response()->json(['message' => 'Stream Dispute submitted successfully'], 200);
         
    }

    public function like(Livestream $livestream)
    {
        auth()->user()->likeLivestream($livestream);
        Session::flash('success', 'Livestream liked successfully.');
        return back();
    }
    
    public function unlike(Livestream $livestream)
    {
        auth()->user()->unlikeLivestream($livestream);
        Session::flash('success', 'Livestream unliked successfully.');
        return back();
    }
    
    
public function LikeStream(Request $request)
{
    try {
        // Validate the request data
        $request->validate([
            'livestream_id' => 'required|integer|exists:livestreams,id',
        ]);

        $livestreamId = $request->input('livestream_id');
        $userId = auth()->id();
        $type = 'like';  // Assuming the type is always 'like' for this endpoint

        // Check if the user has already liked the livestream
        $alreadyLiked = DB::table('livestream_likes')
            ->where('user_id', $userId)
            ->where('livestream_id', $livestreamId)
            ->where('type', $type)
            ->exists();

        if ($alreadyLiked) {
            return response()->json(['status' => 'success', 'message' => 'You have already liked this livestream.'], 200);
        }

        // Perform the like action
        auth()->user()->likeLivestream(Livestream::findOrFail($livestreamId));

        // Log the action
        Log::info('User liked livestream', ['user_id' => $userId, 'livestream_id' => $livestreamId, 'type' => $type]);

        // Return success response
        return response()->json(['status' => 'success', 'message' => 'Livestream liked successfully.'], 200);
    } catch (\Exception $e) {
        // Log the error
        Log::error('Error liking livestream: ' . $e->getMessage(), ['user_id' => $userId, 'livestream_id' => $livestreamId, 'type' => $type]);

        // Return error response
        return response()->json(['status' => 'error', 'message' => 'An error occurred while liking the livestream.'], 500);
    }
}
 
 public function UnlikeStream(Request $request)
{
    try {
        // Validate the request data
        $request->validate([
            'livestream_id' => 'required|integer|exists:livestreams,id',
        ]);

        $livestreamId = $request->input('livestream_id');
        $user = auth()->user();

        // Check if the user has already unliked the livestream
        $existingUnlike = LivestreamLike::where('livestream_id', $livestreamId)
                                        ->where('user_id', $user->id)
                                        ->where('type', 'unlike')
                                        ->first();

        if ($existingUnlike) {
            return response()->json(['status' => 'success', 'message' => 'You have already unliked this livestream.'], 200);
        }

        $livestream = Livestream::findOrFail($livestreamId);

        // Perform the unlike action
        $user->unlikeLivestream($livestream);

        // Log the action
        Log::info('User unliked livestream', ['user_id' => $user->id, 'livestream_id' => $livestream->id]);

        // Return success response
        return response()->json(['status' => 'success', 'message' => 'Livestream unliked successfully.'], 200);
    } catch (\Exception $e) {
        // Log the error
        Log::error('Error unliking livestream: ' . $e->getMessage(), ['user_id' => auth()->id(), 'livestream_id' => $request->input('livestream_id')]);

        // Return error response
        return response()->json(['status' => 'error', 'message' => 'An error occurred while unliking the livestream.'], 500);
    }
}


  public function GetStreamDetails(Request $request)
{
    try {
       
        $request->validate([
            'id' => 'required|integer'
        ]);

        $id = $request->input('id');
        $livestream = Livestream::find($id);

        if (!$livestream) {
            return response()->json(['status' => 'error', 'message' => 'Livestream not found'], 404);
        }
    
            // Livestream statistics
            $pot_amount = Bet::where('game_id', $livestream->id)->sum('amount');
            $setting = Setting::find(1);
            $game_name = $livestream->name; // Assuming the game name is the livestream name
            $player_stats = null; // Fetch player stats if applicable
            $game_id = $livestream->id;
    
            // Fetch betting masters
            $betting_masters = Betting::where('is_active', 1)->orderBy('betting_amount', 'asc')->get();
    
            // Fetch conversion data
            $conversion = DB::table('conversion')->first();
    
            // User-specific data
            $count_label = 0;
            $chk_label = [];
            $count_bet = 0;
            $user_room_names = '';
            $current_room_names = '';
            $rm_name = '';
            $is_user_betted = false;
            $like_count =  DB::table('livestream_likes')
    ->where('livestream_id', $livestream->id)
    ->where('type', 'like')
    ->count();
            $dislike_count = DB::table('livestream_likes')
    ->where('livestream_id', $livestream->id)
    ->where('type', 'like')
    ->count();
            $email = auth()->check() ? auth()->user()->email : '';
            $label_name = null;
    
            if (auth()->check()) {
                $user_id = auth()->id();
                $count_label = UserLabel::where('user_id', $user_id)->count();
                $chk_label = UserLabel::where('user_id', $user_id)->get();
                $l_name = GameLabel::with('userlabel')
                    ->where('user_id', $user_id)
                    ->where('game_id', $livestream->id)
                    ->first();
    
                if ($l_name) {
                    $label_name = $l_name->userlabel->label_game;
                }
    
                if (Bet::where('user_id', $user_id)->count() > 0) {
                    $chk_first_bet = Bet::where('game_id', $game_id)
                        ->orderBy('id', 'asc')
                        ->first();
                    $bet_user_id = $chk_first_bet ? $chk_first_bet->user_id : 'empty';
    
                    if ($bet_user_id == $user_id) {
                        $count_game_room = GameRoom::where('user_id', $user_id)
                            ->where('game_id', $livestream->id)
                            ->count();
    
                        if ($count_game_room > 0) {
                            $user_room_names = UserRoom::where('user_id', $user_id)->get();
                            $current_room_names = GameRoom::where('user_id', $user_id)
                                ->where('game_id', $livestream->id)
                                ->latest()
                                ->first();
                            $count_bet = 1;
                        } else {
                            $count_user_room_names = UserRoom::where('user_id', $user_id)->count();
                            if ($count_user_room_names > 0) {
                                $user_room_names = UserRoom::where('user_id', $user_id)->get();
                                $count_bet = 4;
                            } else {
                                $count_bet = 2;
                            }
                        }
                    } else {
                        $r = GameRoom::with('game_room')
                            ->where('game_id', $livestream->id)
                            ->first();
    
                        if ($r) {
                            $rm_name = $r->game_room->room_name;
                            $count_bet = 3;
                        } else {
                            $count_bet = 0;
                        }
                    }
                } else {
                    $r = GameRoom::with('game_room')
                        ->where('game_id', $livestream->id)
                        ->first();
                    if ($r) {
                        $rm_name = $r->game_room->room_name;
                        $count_bet = 3;
                    } else {
                        $count_bet = 0;
                    }
                }
    
                // Active bets
                $active_bets = BetMain::with(['master', 'user', 'bets'])
                    ->select("bet_main.*",
                        DB::raw("(select count(bets.id) from bets where bets.bet_main_id = bet_main.id) as total"),
                        DB::raw("(select count(bets.id) from bets where bets.bet_main_id = bet_main.id and user_id = '".auth()->id()."') as is_add_bet"),
                        DB::raw("(select count(bets.id) from bets where bets.bet_main_id = bet_main.id and user_id = '".auth()->id()."' AND is_claimed = 1) as is_claim_bet")
                    )
                    ->where('livestream_id', $game_id)
                    ->orderBy('created_at', 'desc')
                    ->get();
    
                foreach ($active_bets as $bet) {
                    if ($bet->user_id === auth()->id()) {
                        $is_user_betted = true;
                        break;
                    }
                }
    
            
    
      
                $dislike_count = 
    
                $viewer = $livestream->viewer()
                    ->where('users_id', auth()->user()->id)
                    ->first();
                if (!$viewer) {
                    $livestream->viewer()->attach(auth()->user()->id);
                }
            } else {
                $r = GameRoom::with('game_room')
                    ->where('game_id', $game_id)
                    ->first();
                if ($r) {
                    $rm_name = $r->game_room->room_name;
                    $count_bet = 3;
                } else {
                    $count_bet = 0;
                }
            }
    Log::info('Livestream ID: ' . $like_count);
            return response()->json([
                'status' => 'success',
                'data' => [
                    'livestream' => $livestream,
                    'pot_amount' => $pot_amount,
                    'setting' => $setting,
                    'game_name' => $game_name,
                    'player_stats' => $player_stats,
                    'active_bets' => $active_bets ?? null,
                    'betting_masters' => $betting_masters,
                    'conversion' => $conversion,
                    'count_label' => $count_label,
                    'chk_label' => $chk_label,
                    'label_name' => $label_name,
                    'count_bet' => $count_bet,
                    'email' => $email,
                    'user_room_names' => $user_room_names,
                    'current_room_names' => $current_room_names,
                    'rm_name' => $rm_name,
                    'is_user_betted' => $is_user_betted,
                    'like_count' => $like_count,
                    'dislike_count' => $dislike_count
                ]
            ]);
        } catch (\Exception $e) {
            
            Log::error('Error in showStream: ' . $e->getMessage());
            return response()->json(['status' => 'error', 'message' => 'An error occurred while fetching the livestream details.'], 500);
        }
    }
    
     public function StreamReport(Request $request)
{
    try {
        // Validate the request data
        $request->validate([
            'stream_id' => 'required|exists:livestreams,id', // Ensure stream_id exists in livestreams table
            'stream_type' => 'required|string',
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'mobile' => 'required|string|max:15', // Adjust max length as needed
            // 'report_for' => 'required|string', // Adjust validation as needed
            'remark' => 'required|string|max:255', // Optional field
        ]);

        // Store the report in the database
        $report = new StreamReport();
        $report->stream_id = $request->input('stream_id');
        $report->stream_type = $request->input('stream_type');
        $report->name = $request->input('name');
        $report->stream_name = $request->input('stream_name');
        $report->email = $request->input('email');
        $report->mobile = $request->input('mobile');
        // $report->report_for = $request->input('report_for'); 
        $report->remark = $request->input('remark');

        $report->save();

        // Report stored successfully, return success response
        return response()->json(['status' => 'success', 'message' => 'Report submitted successfully'], 200);
    } catch (\Illuminate\Validation\ValidationException $e) {
        // Log validation errors
        Log::error('Validation Error in saveStreamReport: ' . $e->getMessage(), ['errors' => $e->errors()]);
        return response()->json(['status' => 'error', 'message' => 'Validation error', 'errors' => $e->errors()], 422);
    } catch (\Exception $e) {
        // Log general errors
        Log::error('Error in saveStreamReport: ' . $e->getMessage());
        return response()->json(['status' => 'error', 'message' => 'An error occurred while submitting the report.'], 500);
    }
}


}
