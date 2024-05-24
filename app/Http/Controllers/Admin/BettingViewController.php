<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Bettingview;
use Illuminate\Http\Request; 
use Illuminate\Support\Facades\Log;

class BettingViewController extends Controller
{
    //
	public function getBettingViewList(){ 
		   $records = Bettingview::paginate(10);
        return view('backend.bettingviewlist', compact('records'));
		
	}
	  public function editBettingView($id)
    {
        $bettingview = Bettingview::find($id);
        return view('backend.bettingviewadd', compact('bettingview'));
    }
	  public function add()
    { 
		$bettingview = optional();   // to send blank object 
        return view('backend.bettingviewadd', compact('bettingview'));
    }
	 
	public function updateBettingView(Request $request , $id ){
		
		$validator_data=$request->validate([
		'no_of_views'	=> 'required|integer' , // validare function		
		'no_of_bet'		=> 'required|integer'  // validare function		
		],
		[
		'no_of_views.required'=>'No of views  required',
		'no_of_views.integer'=>'No of views  must be numberic',
		'no_of_bet.required'=>'No of bets  required',
		'no_of_bet.integer'=>'No of bets  must be numberic '
		]
		);
		 
		$bettingview=Bettingview::find($id);// get  
        $bettingview->no_of_views = $request->input('no_of_views');  
        $bettingview->no_of_bet = $request->input('no_of_bet');  
        $bettingview->save();
        return redirect('bettingview/list')->with('status','Record Updated Successfully');
	}
	
	
	public function saveBettingView(Request $request  ){
		
		$validator_data=$request->validate([
		'no_of_views'	=> 'required|integer' , // validare function		
		'no_of_bet'		=> 'required|integer'  // validare function		
		],
		[
		'no_of_views.required'=>'No of views  required',
		'no_of_views.integer'=>'No of views  must be numberic',
		'no_of_bet.required'=>'No of bets  required',
		'no_of_bet.integer'=>'No of bets  must be numberic '
		]
		);
		   
		$bettingview=new  Bettingview ;// get  
        $bettingview->no_of_views = $request->input('no_of_views');  
        $bettingview->no_of_bet = $request->input('no_of_bet');  
        $bettingview->save();
        return redirect('bettingview/list')->with('status','Record saved Successfully');
	}
	
	public function destroy($id)
    {
        $bettingview = Bettingview::find($id);
        $bettingview->delete();
        return redirect()->back()->with('status','Record Deleted Successfully');
    }



	// API - 

	public function createBettingViewMaster(Request $request)
    {
        try {
            $validator_data = $request->validate([
                'no_of_views' => 'required|integer', 
                'no_of_bet'   => 'required|integer'
            ]);

            $bettingview = new Bettingview();
            $bettingview->no_of_views = $request->input('no_of_views');  
            $bettingview->no_of_bet = $request->input('no_of_bet');  
            $bettingview->save();

            return response()->json(['status' => 'success', 'message' => 'Record created successfully']);
        } catch (\Exception $e) {
            Log::error('Error creating betting view master: ' . $e->getMessage());
            return response()->json(['status' => 'error', 'message' => 'Failed to create record'], 500);
        }
    }
    
    // Get list of betting view master records
    public function getListOfBettingViewMaster()
    { 
        try {
            $records = Bettingview::all();
            return response()->json(['status' => 'success', 'data' => $records]);
        } catch (\Exception $e) {
            Log::error('Error fetching betting view master list: ' . $e->getMessage());
            return response()->json(['status' => 'error', 'message' => 'Failed to fetch records'], 500);
        }
    }
    
    // Update an existing betting view master record
	public function updateBettingViewMaster(Request $request)
{
    try {
        // Validate incoming data including the ID
        $validator_data = $request->validate([
            'id' => 'required|integer',
            'no_of_views' => 'required|integer',
            'no_of_bet'   => 'required|integer'
        ]);

        $id = $request->input('id');

        // Check if the ID exists in the request
        if (!$id) {
            return response()->json(['status' => 'error', 'message' => 'ID is missing in the request'], 400);
        }

        // Find the Bettingview model instance with the given ID
        $bettingview = Bettingview::find($id);

        // Check if the record with the given ID exists
        if (!$bettingview) {
            return response()->json(['status' => 'error', 'message' => 'Record not found'], 404);
        }

        // Update fields with data from the request
        $bettingview->no_of_views = $request->input('no_of_views');
        $bettingview->no_of_bet = $request->input('no_of_bet');

        // Save changes to the database
        $bettingview->save();

        // Return success response
        return response()->json(['status' => 'success', 'message' => 'Record updated successfully']);
    } catch (\Exception $e) {
        // Log error and return error response
        Log::error('Error updating betting view master: ' . $e->getMessage());
        return response()->json(['status' => 'error', 'message' => 'Failed to update record'], 500);
    }
}

    
    // Delete a betting view master record
	public function deleteBettingViewMasterRecord(Request $request)
{
    try {
        // Validate incoming data including the ID
        $validator_data = $request->validate([
            'id' => 'required|integer'
        ]);

        $id = $request->input('id');

        // Find the Bettingview model instance with the given ID
        $bettingview = Bettingview::find($id);

        // Check if the ID exists in the request
        if (!$bettingview) {
            return response()->json(['status' => 'error', 'message' => 'Record not found'], 404);
        }

        // Delete the record
        $bettingview->delete();
        
        // Return success response
        return response()->json(['status' => 'success', 'message' => 'Record deleted successfully']);
    } catch (\Exception $e) {
        // Log error and return error response
        Log::error('Error deleting betting view master record: ' . $e->getMessage());
        return response()->json(['status' => 'error', 'message' => 'Failed to delete record'], 500);
    }
}

}
