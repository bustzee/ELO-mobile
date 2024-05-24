<?php
 

namespace App\Http\Controllers;
//use Illuminate\Support\Facades\Auth;

use Route;
use Session; 
use App\Models\Bet;
use App\Models\Users;
use App\Models\BetMain;
use App\Models\Betting;
use App\Models\Setting;
use App\Models\Livestream;
use Illuminate\Http\Request;
use App\CustomClasses\Api_Helper;
use App\Models\WalletTransaction;
use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class BetController extends Controller
{
    public function index()
    {
        return view('bet');
    }

    public function bet_fn(Request $request)
    { 
        $total_amount = $request->bet_total_amount;
        $g_id = $request->game_id;
        $bet_main_id = $request->main_betting_id;
        $vig_amount = $request->vig_amount;
        $amount = $request->bet_amount;
        $bet_on = $request->bet_on;
		
		$game_info =Livestream::where('id', $g_id)->first(); 
		
		$bet_main_info =BetMain::where('id', $bet_main_id)->first(); 
		
		if($game_info->status!='stopped'){
        $email = auth()->user()->email;  
        $balance = Users::where('Email', $email)->get()->pluck('elo_balance');
		 
        $bal = json_decode($balance[0]); 
        $user_id = Users::where('Email', $email)->get()->pluck('id');
        $u_id = json_decode($user_id[0]);
		
	
		$setting=Setting::find(1);// get setting 	
		  $total_bet_users=Bet::where('game_id', $g_id)->where('bet_main_id', $bet_main_id)->count(); 
		  
		 if($bet_main_info->is_declared_result==0){
		if($setting->no_of_user_can_bet >= $total_bet_users){
		
	 
		$is_added_bet=Bet::where('game_id', $g_id)->where('bet_main_id', $bet_main_id)->where('user_id', $u_id)->count(); // check same use alredy bet for same stream
		
		if($is_added_bet==0){
			$game_id = $game_info->id;
			$game_name = $game_info->name;
		// if($game_info->type=='twitch'){
		// 	$headers = [
		// 		"Authorization: Bearer jc4d6jfr4u6008p0oaglxxjp5rmklu",
		// 		"Client-Id: 43s48r8zwlgnvwpk5xsc1gk7efa3js"
		// 	];
		// 	$url = "https://api.twitch.tv/helix/streams?user_id=" . $g_id;
		// 	$APIHELPER = new Api_Helper($url, $headers, true, true);
		// 	$response = $APIHELPER->CallApi();

		// 	$game_id = $response['data'][0]["user_id"];//user_id is a game id
		// 	$game_name = $response['data'][0]["title"];
		// }else{
		// 	$game_id = $game_info->id;
        // $game_name = $game_info->name;
		// }

        if ($bal < $total_amount) {
            return json_encode(["msg1" => 0, "msg2" => "Sorry your Elo Balance is less than your Bet amount. Please recharge Elo Wallet"]);
        } else {
            $elo_balance =  $bal -  $total_amount;
            $bet = new Bet;
            $bet->user_id = $u_id;
            $bet->game_id = $game_id;
            $bet->game_name = $game_name;
            $bet->bet_main_id = $bet_main_id;
            $bet->bet_on = $bet_on;
            $bet->amount = $amount;
            $bet->vig_amount = $vig_amount;
            $bet->total_amount = $total_amount;

            if ($bet->save()) {
				
				// $wallet = new WalletTransaction;
				$wallet['user_id'] = $u_id;
				$wallet['bet_main_id'] = $bet_main_id;
				$wallet['bet_id'] = $bet->id;
				$wallet['game_id'] = $game_id;
				$wallet['win_side'] = $bet_on;
				$wallet['transaction_type'] = 'debit';
				$wallet['transaction_amount'] = $total_amount; 
				$wallet['comment'] = "Betting";
				WalletTransaction::create($wallet);
				
                $upd = Users::where('Email', $email)
                    ->update([
                        'elo_balance' => $elo_balance
                    ]);
					
				$html=$this->getStreamBetHtml($game_id,$u_id);
					
                return json_encode(['msg1' => '1', 'update_html'=>'1' ,'html'=>$html , 'msg2' => 'Your bet is successfully placed, stay tuned']);
            } else {
                return json_encode(['msg1' => '0', 'update_html'=>'0' ,'html'=>'','msg2' => 'Something went wrong']);
            }

        }
		}else{
			 return json_encode(['msg1' => '0', 'update_html'=>'0' ,'html'=>'', 'msg2' => 'You have alredy bet for this']);
		}
		}else{
			 return json_encode(['msg1' => '0', 'update_html'=>'0' ,'html'=>'', 'msg2' => 'Ooops! Limit up , please try another bet']);
		}
		}else{
			 return json_encode(['msg1' => '0', 'update_html'=>'0' ,'html'=>'', 'msg2' => 'Ooops! Bet is over']);
		}
		}else{
			 return json_encode(['msg1' => '0', 'update_html'=>'0' ,'html'=>'', 'msg2' => 'Ooops! Stream is stopped']);
		}
   }


	// This function used to fetch all bets
    public function show_all_bet($game_id)
    {
       // $all_active_bets = Bet::with('user')->where('game_id', $game_id)->orderBy('created_at', 'desc')->get();
		$all_active_bets = BetMain::with('user')->where('game_id', $game_id)->orderBy('created_at', 'desc')->get();
        return response()->json(['data' => $all_active_bets]);
    }
	
	//This function used for create new bet
	public function saveNewBet( Request $request ){
	 
		if($request->betting_id=='-1'){
			
		}else{
			$betting_id = $request->betting_id;
			$betting_info =Betting::where('id', $betting_id)->first(); 
		}
		
		
        $g_id = $request->game_id;
		$game_info =Livestream::where('id', $g_id)->first(); 
		
        $email = auth()->user()->email;  
        $balance = Users::where('Email', $email)->get()->pluck('elo_balance');
		 
        $bal = json_decode($balance[0]); 
        $user_id = Users::where('Email', $email)->get()->pluck('id');
        $u_id = json_decode($user_id[0]);
		$game_id = $game_info->id;
		$game_name = $game_info->name;
		
		   $total_bet_created = BetMain::where('user_id', $u_id)->where('livestream_id', $game_id)->get()->count();
		 
		
	/*			
		 if($game_info->type=='twitch'){
		 	$headers = [
		 		"Client-Id: 43s48r8zwlgnvwpk5xsc1gk7efa3js"
		 	];
		 	$url = "https://api.twitch.tv/helix/streams?user_id=" . $game_info-.stream;
		 	$APIHELPER = new Api_Helper($url, $headers, true, true);
			$response = $APIHELPER->CallApi();

		 	$game_id = $response['data'][0]["user_id"];//user_id is a game id
		 	$game_name = $response['data'][0]["title"];
		}else{
		 	$game_id = $game_info->id;
		 	$game_name = $game_info->name;
		 }
 */
			if($total_bet_created < 6 ){   // can not create new bet maximum than 5 
            $bet = new BetMain;
			if($request->betting_id=='0'){
				$nbetting=new  Betting ;// get  
				$nbetting->betting_amount =$request->custom_amount;  
				$nbetting->description = 'Custom Bet';
				$nbetting->is_active = 0;  
				$nbetting->added_by = 0;  
				$nbetting->save();
				
				$bet->master_betting_id =$nbetting->id; 
				$bet->betting_amount = $request->custom_amount; 
			}else{
				$bet->master_betting_id = $betting_info->id; 
				$bet->betting_amount = $betting_info->betting_amount; 
			}           
            $bet->for_text = $request->for_text;
            $bet->against_text = $request->against_text;
            $bet->description = $request->description;
            $bet->user_id = $u_id;
            $bet->livestream_id = $game_id;  
            if ($bet->save()) {  
			
				$html=$this->getStreamBetHtml($game_id,$u_id);
                return json_encode(['msg1' => '1', 'update_html'=>'1' ,'html'=>$html , 'msg2' => 'Your bet is created successfully  , stay tuned']);
            } else {
                return json_encode(['msg1' => '0', 'update_html'=>'0' ,'html'=>'', 'msg2' => 'Something went wrong']);
            }
		} else {
                return json_encode(['msg1' => '0', 'update_html'=>'0' ,'html'=>'', 'msg2' => 'you have exceeded limit of creating bet on this stream . Max 5 bets can be created ']);
            }
       
	}
	
	
	public function AddBet(Request $request)
{
    try {
        // Authenticate the user
        $user = auth()->user();
        if (!$user) {
            return response()->json(['status' => 'error', 'message' => 'Unauthorized'], 401);
        }

        // Get user's email, balance, and ID
        $email = $user->email;
        $balance = Users::where('Email', $email)->value('elo_balance');
        $balance = json_decode($balance);
        $userId = $user->id;

        // Get game information
        $gameId = $request->game_id;
        $gameInfo = Livestream::find($gameId);

        // Check if the betting ID is provided
        if ($request->betting_id == '-1') {
            // Handle case when no betting ID is provided (create new custom bet)
            $bettingAmount = $request->custom_amount;
            $description = 'Custom Bet';
            $isActive = 0;
            $addedBy = 0;
            $newBetting = Betting::create([
                'betting_amount' => $bettingAmount,
                'description' => $description,
                'is_active' => $isActive,
                'added_by' => $addedBy,
            ]);
            $masterBettingId = $newBetting->id;
        } else {
            // Handle case when betting ID is provided (existing bet)
            $bettingInfo = Betting::find($request->betting_id);
            $masterBettingId = $bettingInfo->id;
            $bettingAmount = $bettingInfo->betting_amount;
        }

        // Check total bets created by the user for the stream
        $totalBetsCreated = BetMain::where('user_id', $userId)->where('livestream_id', $gameId)->count();

        if ($totalBetsCreated < 6) { // Maximum 5 bets can be created
            // Create a new bet
            $bet = new BetMain;
            $bet->master_betting_id = $masterBettingId;
            $bet->betting_amount = $bettingAmount;
            $bet->for_text = $request->for_text;
            $bet->against_text = $request->against_text;
            $bet->description = $request->description;
            $bet->user_id = $userId;
            $bet->livestream_id = $gameId;

            if ($bet->save()) {
                // Get updated HTML for displaying bets
                $html = $this->getStreamBetHtml($gameId, $userId);
                return response()->json([
                    'status' => 'success',
                    'message' => 'Your bet is created successfully, stay tuned'
                ]);
            } else {
                return response()->json(['status' => 'error', 'message' => 'Failed to create bet']);
            }
        } else {
            return response()->json(['status' => 'error', 'message' => 'You have exceeded the limit of creating bets on this stream. Maximum 5 bets can be created.']);
        }
    } catch (\Exception $e) {
        // Log the exception
        Log::error('Error adding bet: ' . $e->getMessage());

        // Return error response
        return response()->json(['status' => 'error', 'message' => 'Something went wrong'], 500);
    }
}

public function getBetDetails(Request $request)
{
    try {
        // Validate the request
        $request->validate([
            'livestream_id' => 'required|numeric',
        ]);

        // Retrieve livestream ID from the request
        $livestreamId = $request->input('livestream_id');

        // Retrieve the authenticated user ID
        $userId = Auth::id();

        // Fetch the livestream details
        $livestream = Livestream::findOrFail($livestreamId);
        $setting = Setting::find(1);

        // Fetch the pot amount
        $potAmount = Bet::where('game_id', $livestreamId)->sum('amount');

        // Fetch all active bets for the specified livestream ID
        $activeBets = BetMain::with(['master', 'user', 'bets'])
            ->select("bet_main.*",
                DB::raw("(SELECT count(bets.id) FROM bets WHERE bets.bet_main_id = bet_main.id) as total"),
                DB::raw("(SELECT count(bets.id) FROM bets WHERE bets.bet_main_id = bet_main.id AND user_id = $userId) as is_add_bet"),
                DB::raw("(SELECT count(bets.id) FROM bets WHERE bets.bet_main_id = bet_main.id AND user_id = $userId AND is_claimed = 1) as is_claim_bet")
            )
            ->where('livestream_id', $livestreamId)
            ->orderBy('created_at', 'desc')
            ->get();

        // Structure the response data
        $betsData = $activeBets->map(function ($bet) use ($livestream, $setting, $userId) {
            // Check if the authenticated user has placed a bet on this bet main
            $userBet = $bet->bets->where('user_id', $userId)->first();
            $isBetted = !is_null($userBet);
            $isWon = $isBetted ? $userBet->is_win : false;
            $isClaimed = $isBetted ? $userBet->is_claimed : false;

            return [
                'bet_type' => $bet->master->description,
                'description' => $bet->description,
                'bet_for' => $bet->for_text,
                'bet_against' => $bet->against_text,
                'winning_amount' => $bet->betting_amount,
                'no_of_bets' => $bet->bets()->count() . '/' . $setting->no_of_user_can_bet,
                'active_hours' => $bet->created_diff,
                'status' => $bet->status,
                'user' => [
                    'username' => $bet->user->username,
                    'bet_on' => $bet->for_text,
                    'bet_amount' => $bet->betting_amount,
                    'vig' => $setting->vig,
                    'total' => $bet->betting_amount + $setting->vig,
                    'created_on' => $bet->created_at,
                    'winning_amount' => $bet->winning_amount,
                    'is_betted' => $isBetted,
                    'is_won' => $isWon,
                    'is_claimed' => $isClaimed
                ]
            ];
        });

        return response()->json([
            'status' => 'success',
            'data' => [
                'stream_name' => $livestream->name,
                'description' => $livestream->description,
                'pot_amount' => $potAmount,
                'bets' => $betsData
            ]
        ]);
    } catch (\Exception $e) {
        Log::error('Error fetching bet details: ' . $e->getMessage());
        return response()->json([
            'status' => 'error',
            'message' => 'Failed to fetch bet details.',
        ], 500);
    }
}
	//Sangita get srteam detail  page bet list html
	
	public function getStreamBetHtml($game_id,$u_id){
		$livestream = Livestream::where('id', $game_id)
            ->first();
		
			$pot_amount = Bet::where('game_id', $game_id)->sum('amount');
		
			$active_bets = BetMain::with(['master','user','bets'])
            ->select("bet_main.*",
		                     DB::raw("( select count(bets.id)  from bets  where bets.bet_main_id =  bet_main.id) as total"),
		                     DB::raw("( select count(bets.id)  from bets  where bets.bet_main_id =  bet_main.id and user_id = '".$u_id."' ) as is_add_bet"),
		                     DB::raw("( select count(bets.id)  from bets  where bets.bet_main_id =  bet_main.id and user_id = '".$u_id."' AND is_claimed  = 1  ) as is_claim_bet")
							 )
            ->where('livestream_id', $game_id)->orderBy('created_at', 'desc')->get();
			$setting=Setting::find(1);// get setting 	
	 
	
			$html='<p class="text-light">List of Active Bets <span style="float:right"> Pot Amount : '.$pot_amount .'<span></p>
            <div style="min-height: 400px">
			 
                <table class="table text-light table-bordered" style="background: black;">
                    <tr>
                        <th style="color: white;">#</th>
                        <th style="color: white;">Bet Type</th>
                        <th style="color: white;">Description</th>
                        <th style="color: white;">For</th>
                        <th style="color: white;">Against</th>
                        <th style="color: white;">Winning Amount</th>
                        <th style="color: white;">No Of. Bets</th>
                        <th style="color: white;">Active Hours</th>
                        <th style="color: white;"> Action</th>

                    </tr>';
                  foreach($active_bets as $key=>$active_bet)  {
                    $html=$html.'<tr>
                        <td>'.++$key.'</td>
                        <td>'.$active_bet->master->description.'</td> 
                        <td>'.$active_bet->description.'</td>
                        <td>'.$active_bet->for_text.'</td>
                        <td>'.$active_bet->against_text.'</td>
                        <td>'.$active_bet->betting_amount.'</td>
                        <td>'.$active_bet->bets()->count().'/'.$setting->no_of_user_can_bet.'</td>
                        <td>'.$active_bet->created_diff.'</td>
                        <td>';
					 if($active_bet->is_claim_bet){
							$html=$html.'Claimed!!';
					}else{
						if($active_bet->is_add_bet){
						$html=$html.'<button type="button"  data-id="'. $active_bet->id .'" class="btn btn-success claim_bet">
                               Claim Bet  
                            </button>';
					}else{
						if($livestream->status != "stopped"){
						if($livestream->is_declared_result == 0 ){
						if($active_bet->total<$setting->no_of_user_can_bet){
                            $html=$html.'<button type="button" data-bet-type="'.$active_bet->master->description.'" data-betting_amount="'. $active_bet->betting_amount .'" data-vig_amount="'. $setting->vig.'" data-against_text="'. $active_bet->against_text .'" data-for_text="'. $active_bet->for_text .'" data-description="'. $active_bet->description .'" data-id="'. $active_bet->id .'" class="btn btn-primary bet_now_model">
                                Bet now
                            </button>';
					}
			}
			}
	}
} 
                        $html=$html.'</td>
                    </tr>';
                    } 
                $html=$html.'</table> 
            </div>
            <br>';
	return $html;		
				 
	}
	
	// Sangita - Calculate vig amount
public function calculateVig(Request $request){ 
	$betting_main_id = $request->betting_main_id;
	$game_id = $request->game_id;
	$bet_on = $request->bet_on;
	
	 $setting=Setting::find(1);// get 
	
	//$vig_amount=Bet::where('game_id', $game_id)->where('bet_main_id', $betting_main_id)->where('bet_on', $bet_on)->get()->sum('vig_amount'); 
	
//    $for_vig_amount=Bet::where('game_id', $game_id)->where('bet_main_id', $betting_main_id)->where('bet_on', 'for')->limit(1)->orderBy('id','desc')->pluck('vig_amount')->first(); 
	//  $against_vig_amount=Bet::where('game_id', $game_id)->where('bet_main_id', $betting_main_id)->where('bet_on', 'against')->limit(1)->orderBy('id','desc')->pluck('vig_amount')->first(); 
	  
	 $for_vig_amount=Bet::where('game_id', $game_id)->where('bet_main_id', $betting_main_id)->where('bet_on', 'for')->get()->sum('vig_amount'); 
	
	 $against_vig_amount=Bet::where('game_id', $game_id)->where('bet_main_id', $betting_main_id)->where('bet_on', 'against')->get()->sum('vig_amount'); 
	 if(($for_vig_amount==0)&&($against_vig_amount==0)){
		 $vig=0;
	 }elseif($for_vig_amount == $against_vig_amount){
		$vig=0;
	 }else{
		
		// formula maximum vig amount- minimum vig amount / division factor 
		
		 if(($for_vig_amount>$against_vig_amount)&&($bet_on=='for')){
			 $vig= ((($for_vig_amount-$against_vig_amount)/$setting->extra_vig_division_factor));
		 }elseif(($for_vig_amount>$against_vig_amount)&&($bet_on=='against')){
			 $vig=0;
		 }elseif(($against_vig_amount>$for_vig_amount)&&($bet_on=='against')){
			 $vig= ((($against_vig_amount-$for_vig_amount)/$setting->extra_vig_division_factor));
		 }elseif(($against_vig_amount>$for_vig_amount)&&($bet_on=='for')){
			 $vig=0;
		 } 
		 
	 }
	
	 
	$vig=$vig+$setting->vig;
	//$temp=number_format($vig,1);
	//$vig= str_replace(',','',$temp);
	$vig= round($vig);
	return json_encode(['vig' => $vig]);
}

	// 	Sangita - This function  used for set  bet as declarated result
	public	function setDeclaredResult(Request $request ){
		 
				
				$game_id=$request->input('game_id');
				$id=$request->input('id'); 
				$betmain=BetMain::find($id);// get   
				$betmain->won_side = $request->input('won_side');  
				$betmain->is_declared_result = 1;  
				$betmain->declaration_by = auth()->user()->id;  
				$betmain->declaration_date = date('Y-m-d H:i:s');  
				$betmain->save();
				
				$this->distributionResult($betmain->id);
				return redirect('report/active_bet_list/'.$game_id)->with('status','Result Declared Successfully');
		}


		// 	Sangita - This function used to update elo balance of win user and stream owner
	public function distributionResult($id){
		$bet_main_rs=BetMain::find($id);// get setting 	
		$total_bet_amount=Bet::where('bet_main_id', $id)->sum('amount');
		$total_bet_win_users=Bet::where('bet_on', $bet_main_rs->won_side)->where('bet_main_id', $id)->count();		
		$total_bet_opp_users=Bet::where('bet_on', '!=', $bet_main_rs->won_side)->where('bet_main_id', $id)->count();		
		$win_users=Bet::where('bet_on', $bet_main_rs->won_side)->where('bet_main_id', $id)->get();	
		$against_users=Bet::where('bet_on','!=', $bet_main_rs->won_side)->where('bet_main_id', $id)->get();			
		
		if(($total_bet_opp_users > 0 )&&($total_bet_win_users > 0 )){
				// distribute price
				$dmount=$total_bet_amount/$total_bet_win_users;
				$divd_amount=round($dmount,PHP_ROUND_HALF_DOWN);
			
				foreach($win_users as $win_user){
					$user_info=Users::find($win_user->user_id);
					if($user_info){
					$wallet = new WalletTransaction;
					$wallet->user_id = $win_user->user_id;
					$wallet->bet_main_id = $win_user->bet_main_id;
					$wallet->bet_id = $win_user->id;
					$wallet->game_id = $win_user->game_id;
					$wallet->win_side =$win_user->bet_on;
					$wallet->transaction_type = 'credit';
					$wallet->transaction_amount = $divd_amount;
					$wallet->comment = "Won Amount";
					$wallet->save();
					
					$upb = Bet::where('id', $win_user->id)
						->update([
							'win_amount' =>  $divd_amount,
							'is_win'=>1
						]);
						
					$elo_balance=0;
					 $elo_balance =  $user_info->elo_balance +  $divd_amount;
					  $upd = Users::where('id', $user_info->id)
						->update([
							'elo_balance' =>   $elo_balance
						]);
				}
			
				
				
			}
				
			 
			
		}else{
			// trasfer as it
			foreach($win_users as $win_user){
				$user_info=Users::find($win_user->user_id);
				
				$wallet = new WalletTransaction;
				$wallet->user_id = $win_user->user_id;
				$wallet->bet_main_id = $win_user->bet_main_id;
				$wallet->bet_id = $win_user->id;
				$wallet->game_id = $win_user->game_id;
				$wallet->win_side =$win_user->bet_on;
				$wallet->transaction_type = 'credit';
				$wallet->transaction_amount = $win_user->amount;
				$wallet->comment = "Bet Refund";
				$wallet->save();
				
				$upb = Bet::where('id', $win_user->id)
						->update([
							// 'win_amount' =>  $divd_amount,
							'is_win'=>-4
						]);
						// is_win 4 for the bet not win and lost so we call it abandoned
				
				$elo_balance=0;
				 $elo_balance =  $user_info->elo_balance +  $win_user->amount;
				  $upd = Users::where('id', $win_user->user_id)
                    ->update([
                        'elo_balance' =>   $elo_balance
                    ]);
			}
			
			// trasfer as it
			foreach($against_users as $win_user){
				$user_info=Users::find($win_user->user_id);
				
				$wallet = new WalletTransaction;
				$wallet->user_id = $win_user->user_id;
				$wallet->bet_main_id = $win_user->bet_main_id;
				$wallet->bet_id = $win_user->id;
				$wallet->game_id = $win_user->game_id;
				$wallet->win_side =$win_user->bet_on;
				$wallet->transaction_type = 'credit';
				$wallet->transaction_amount = $win_user->amount;
				$wallet->comment = "Bet Refund";
				$wallet->save();
				
				$upb = Bet::where('id', $win_user->id)
						->update([
							// 'win_amount' =>  $divd_amount,
							'is_win'=>-4
						]);
						// is_win 4 for the bet not win and lost so we call it abandoned
				
				$elo_balance=0;
				 $elo_balance =  $user_info->elo_balance +  $win_user->amount;
				  $upd = Users::where('id', $win_user->user_id)
                    ->update([
                        'elo_balance' =>   $elo_balance
                    ]);
			}
			
			
		
		}
		 
		
				$game_info =Livestream::where('id', $bet_main_rs->livestream_id)->first();
				 
				if(!$game_info->type){
				$total_vig_Amount=Bet::where('bet_main_id', $id)->sum('vig_amount');
				$setting=Setting::find(1);// get setting 	
				$streamer_amt=round(($total_vig_Amount*$setting->streamer_per)/100);
				$wallet = new WalletTransaction;
				$wallet->user_id = $game_info->user_id;
				$wallet->bet_main_id = $bet_main_rs->id;
				// $wallet->bet_id = 0;
				$wallet->game_id = $bet_main_rs->game_id;
				$wallet->win_side =$bet_main_rs->won_side;
				$wallet->transaction_type = 'credit';
				$wallet->transaction_amount = $streamer_amt;
				$wallet->comment = "Streamer Fees";
				$wallet->save();
				
				$user_info=Users::find($game_info->user_id);
				Log::info($user_info->elo_balance.'oldelo balance');
				$elo_balance=0;
				 $elo_balance =  $user_info->elo_balance ? ($user_info->elo_balance + $streamer_amt) : $streamer_amt;

				$upd = Users::where('id', $user_info->id)
                    ->update([
                        'elo_balance' => $elo_balance
                    ]);
				/* tap($user_info->update([
					'elo_balance' =>   $elo_balance
				 ])); */
				 Log::info($user_info);
				 Log::info($elo_balance.'ellobalanc.');
				 Log::info($streamer_amt.'stream amount.'); 
					$upds = BetMain::where('id', $bet_main_rs->id)
                    ->update([
                        'streamer_fee' =>   $streamer_amt
                    ]);
				}
			
	}

	// 	Sangita - This function used to update bet as  claimed 
	public function setClaimBet(Request $request){
		$bet_main_id = $request->betting_main_id;
		$uname = auth()->user();
		$user_id = $uname->id;
		
		$claim_bet =Bet::where('bet_main_id', $bet_main_id)->where('user_id', $user_id)->first(); 
		
		$betting=Bet::find($claim_bet->id);// get  
        $betting->is_claimed = 1;  
        $betting->claimed_date =date('Y-m-d H:i:s');  
        $betting->save();
		$html=$this->getStreamBetHtml($request->game_id,$user_id);
		$return['msg']='Bet Claimed successfully';
		$return['update_html']='1';
		$return['html']=$html;
		return json_encode($return);
	}
	
	
	public function ClaimBet(Request $request) {
		try {
			// Validate the request to ensure required fields are present
			$request->validate([
				'bet_main_id' => 'required',
				'game_id' => 'required|integer'
			]);
	
			$bet_main_id = $request->input('bet_main_id');
			$uname = auth()->user();
			$user_id = $uname->id;
	
			$claim_bet = Bet::where('bet_main_id', $bet_main_id)->where('user_id', $user_id)->first();
	
			if (!$claim_bet) {
				return response()->json([
					'status' => 'error',
					'message' => 'Bet not found'
				], 404);
			}
	
			$betting = Bet::find($claim_bet->id);
			$betting->is_claimed = 1;
			$betting->claimed_date = now();
			$betting->save();
	
		
			return response()->json([
				'status' => 'success',
				'message' => 'Bet claimed successfully'
				
			], 200);
		} catch (\Exception $e) {
			// Log the error with a detailed message
			Log::error('Error in setClaimBet: ' . $e->getMessage(), [
				'user_id' => $user_id ?? null,
				'bet_main_id' => $bet_main_id ?? null,
				'exception' => $e
			]);
	
			return response()->json([
				'status' => 'error',
				'message' => 'An error occurred while claiming the bet'
			], 500);
		}
	}
	
// 	public function getBetbyuserId(Request $request)
// {
// 	try {
// 		// Validate the request
// 		$request->validate([
// 			'livestream_id' => 'required|numeric',
// 		]);

// 		// Retrieve livestream ID from the request
// 		$livestreamId = $request->input('livestream_id');

// 		// Retrieve the authenticated user ID
// 		$userId = Auth::id();

// 		// Fetch bets by user ID and livestream ID
// 		$userBets = Bet::where('user_id', $userId)
// 			->where('game_id', $livestreamId)
// 			->with('betMain.master', 'betMain.user')
// 			->get();

// 		// Structure the bets response data
// 		$betsData = $userBets->map(function ($bet) {
// 			return [
// 				'bet_main_id' => $bet->bet_main_id,
// 				'amount' => $bet->amount,
// 				'is_claimed' => $bet->is_claimed,
// 				'claimed_date' => $bet->claimed_date,
// 				'bet_details' => [
// 					'bet_type' => $bet->betMain->master->description,
// 					'description' => $bet->betMain->description,
// 					'bet_for' => $bet->betMain->for_text,
// 					'bet_against' => $bet->betMain->against_text,
// 					'winning_amount' => $bet->betMain->betting_amount,
// 					'status' => $bet->betMain->status,
// 					'user' => [
// 						'username' => $bet->betMain->user->username,
// 						'bet_on' => $bet->betMain->for_text,
// 						'bet_amount' => $bet->betMain->betting_amount,
// 						'created_on' => $bet->betMain->created_at,
// 						'winning_amount' => $bet->betMain->winning_amount,
// 					]
// 				]
// 			];
// 		});

// 		// Return the structured response
// 		return response()->json([
// 			'status' => 'success',
// 			'data' => [
// 				'user_bets' => $betsData,
// 			]
// 		]);
// 	} catch (\Exception $e) {
// 		Log::error('Error fetching bet details: ' . $e->getMessage());
// 		return response()->json([
// 			'status' => 'error',
// 			'message' => 'Failed to fetch bet details.',
// 		], 500);
// 	}
// }


public function getBetbyuserId(Request $request)
{
    try {
        // Retrieve the authenticated user ID
        $userId = Auth::id();

        // Fetch bets by user ID for all Livestreams
        $userBets = Bet::where('user_id', $userId)
            ->with('betMain.master', 'betMain.user')
            ->get();

        // Structure the bets response data
        $betsData = $userBets->map(function ($bet) {
            return [
                'bet_main_id' => $bet->bet_main_id,
                'game_id'=>$bet->game_id,
                'amount' => $bet->amount,
                'is_claimed' => $bet->is_claimed,
                'claimed_date' => $bet->claimed_date,
                'bet_details' => [
                    'bet_type' => $bet->betMain->master->description,
                    'description' => $bet->betMain->description,
                    'bet_for' => $bet->betMain->for_text,
                    'bet_against' => $bet->betMain->against_text,
                    'winning_amount' => $bet->betMain->betting_amount,
                    'status' => $bet->betMain->status,
                    'user' => [
                        'username' => $bet->betMain->user->username,
                        'bet_on' => $bet->betMain->for_text,
                        'bet_amount' => $bet->betMain->betting_amount,
                        'created_on' => $bet->betMain->created_at,
                        'winning_amount' => $bet->betMain->winning_amount,
                    ]
                ]
            ];
        });

        // Return the structured response
        return response()->json([
            'status' => 'success',
            'data' => [
                'user_bets' => $betsData,
            ]
        ]);
    } catch (\Exception $e) {
        Log::error('Error fetching bet details: ' . $e->getMessage());
        return response()->json([
            'status' => 'error',
            'message' => 'Failed to fetch bet details.',
        ], 500);
    }
}



}
