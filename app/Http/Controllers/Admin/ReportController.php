<?php

namespace App\Http\Controllers\Admin;

use App\Models\Bet;
use App\Models\BetMain;
use App\Models\Setting;
use App\Models\Livestream;
use App\Models\StreamReport;
use App\Models\StreamDispute;
use Illuminate\Http\Request; 
use Illuminate\Support\Facades\DB;


use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller; 

class ReportController extends Controller
{
    //
	public function getActiveBetList($id){  
			$stram_info = Livestream::find($id);
			
			// $records = DB::table('notices')select("SELECT bm.*, u.username ,  ( select count(b.id)  from bets as b  where bet_main_id =  bm.master_betting_id) as total  ,  ( select count(b.id)  from bets as b  where bet_main_id =  bm.master_betting_id and bet_on ='for') as for_total  ,  ( select count(b.id)  from bets as b  where bet_main_id =  bm.master_betting_id and  bet_on ='against' ) as against_total     FROM `bet_main` as bm  ,  users  as u where game_id =  '".$id."' and u.id= bm.user_id;") ; 
		 //  $records = BetMain::with('bet')->where('game_id', $id)->paginate(10); 
		  $setting=Setting::find(1);// get setting 	
		  
		  
		  $records = DB::table("bet_main") 
		 ->select("bet_main.*","users.username",
		                     DB::raw("( select count(bets.id)  from bets  where bets.bet_main_id =  bet_main.id) as total"),
		                     DB::raw("( select count(bets.id)  from bets   where bet_main_id =  bet_main.id and bet_on ='for') as for_total"),
		                     DB::raw("( select count(bets.id)  from bets    where bet_main_id =  bet_main.id and  bet_on ='against' ) as against_total"))
			 ->join('users', 'users.id', '=', 'bet_main.user_id')
			->where('livestream_id', $id)->orderBy('created_at','desc')->paginate(10);  
	 


			return view('backend.report.activebetlist',  ['records' => $records,'stram_info'=>$stram_info,'setting'=>$setting]);
		
	}
 
 
 public function getBetterList($id){  
			$bet_info = BetMain::with('bets')->find($id);
			$stram_info = Livestream::find($bet_info->livestream_id);
		  $records = Bet::with('user')->where('bet_main_id', $id)->orderBy('created_at','desc')->paginate(10); 
		   
			return view('backend.report.betterlist',  ['records' => $records,'stram_info'=>$stram_info,'bet_info'=>$bet_info]);
		
	}

	public function reportedStreams()
	{
		$records = StreamReport::orderBy('id','desc')->paginate(10); 
		return view('backend.report.reported-streams',  ['records' => $records]);
	}



	public function bettingDisputes()
	{
		$records = StreamDispute::orderBy('id','desc')->paginate(10); 
		return view('backend.report.betting-disputes',  ['records' => $records]);
	}

	// api

	public function GetReportedStreams(Request $request)
{
    try {
        // Fetch records from the database
        $records = StreamReport::orderBy('id', 'desc')->get();
        // Return a JSON response
        return response()->json(['status' => 'success', 'data' => $records], 200);
       } 

	catch (\Exception $e) 
	{
        // Log error and return error response
        Log::error('Error fetching reported streams: ' . $e->getMessage());
        return response()->json(['status' => 'error', 'message' => 'Failed to fetch reported streams'], 500);
    }
}


public function GetBettingDisputes(Request $request)
{
    try {
        // Fetch records from the database
        $records = StreamDispute::orderBy('id', 'desc')->get();
        // Return a JSON response
        return response()->json(['status' => 'success', 'data' => $records], 200);
       } 

	catch (\Exception $e) 
	{
        // Log error and return error response
        Log::error('Error fetching reported streams: ' . $e->getMessage());
        return response()->json(['status' => 'error', 'message' => 'Failed to fetch reported streams'], 500);
    }
}
 
 }
