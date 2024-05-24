<?php

namespace App\Http\Controllers\Admin;

use App\Models\Betting;
use Illuminate\Http\Request; 
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class BettingController extends Controller
{
    //
	public function getBettingList(){ 
		   $records = Betting::where('added_by', 1)->orderBy('created_at','desc')->paginate(10);
        return view('backend.bettinglist', compact('records'));
		
	}
	  public function editBetting($id)
    {
        $betting = Betting::find($id);
        return view('backend.bettingadd', compact('betting'));
    }
	  public function add()
    { 
		$betting = optional();   // to send blank object 
        return view('backend.bettingadd', compact('betting'));
    }
	 
	public function updateBetting(Request $request , $id ){
		
		$validator_data=$request->validate([
		'betting_amount'	=> 'required|decimal:0,2' , // validare function		
		'description'		=> 'required|max:255'  // validare function		
		],
		[
		'betting_amount.required'=>'Billing amount required',
		'betting_amount.decimal'=>'Billing amount must be numberic',
		'description.required'=>'Description required',
		'description.max'=>'Description required maximum 255 character ' 
		]
		);
		 
		$betting=Betting::find($id);// get  
        $betting->betting_amount = $request->input('betting_amount');  
        $betting->description = $request->input('description');  
        $betting->save();
        return redirect('betting/list')->with('status','Record Updated Successfully');
	}
	
	
	public function saveBetting(Request $request  ){
		
		$validator_data=$request->validate([
		'betting_amount'	=> 'required|decimal:0,2' , // validare function		
		'description'		=> 'required|max:255' 
		 // validare function		
		],
		[
		'betting_amount.required'=>'Billing amount required',
		'betting_amount.decimal'=>'Billing amount must be numberic',
		'description.required'=>'Description required',
		'description.max'=>'Description required maximum 255 character '
		]
		);
		   
		$betting=new  Betting ;// get  
        $betting->betting_amount = $request->input('betting_amount');  
        $betting->description = $request->input('description');  
		
        
        $betting->save();
        return redirect('betting/list')->with('status','Record saved Successfully');
	}


	public function GetListOfBettingMaster()
{
    try {
        // Fetch all Betting records
        $bettings = Betting::all();

        // Return success response with the list of records
        return response()->json([
            'status' => 'success',
            'message' => 'Betting master records retrieved successfully',
            'bettings' => $bettings
        ], 200);
    } catch (\Exception $e) {
        // Log the error
        Log::error('Error retrieving betting master records: ' . $e->getMessage());

        // Return error response
        return response()->json([
            'status' => 'error',
            'message' => 'An error occurred while retrieving betting master records.'
        ], 500);
    }
}

public function DeleteBettingMasterRecord(Request $request)
{
    try {
        // Check if the request contains the 'id' parameter
        if (!$request->has('id')) {
            return response()->json([
                'status' => 'error',
                'message' => 'Betting ID is required'
            ], 422);
        }

        // Find the betting record by ID
        $betting = Betting::find($request->id);

        // If the record does not exist, return error response
        if (!$betting) {
            return response()->json([
                'status' => 'error',
                'message' => 'Betting record not found'
            ], 404);
        }

        // Delete the record
        $betting->delete();

        // Return success response
        return response()->json([
            'status' => 'success',
            'message' => 'Betting record deleted successfully',
        ], 200);

    } catch (\Exception $e) {
        // Log the error
        Log::error('Error deleting betting record: ' . $e->getMessage());

        // Return error response
        return response()->json([
            'status' => 'error',
            'message' => 'An error occurred while deleting the betting record.'
        ], 500);
    }
}

	public function CreateBettingMaster(Request $request)
{
    try {
        // Validate the request data
        $validator = Validator::make($request->all(), [
            'betting_amount' => 'required|numeric|between:0,9999999999999.99',
            'description' => 'required|max:255',
        ], [
            'betting_amount.required' => 'Betting amount is required',
            'betting_amount.numeric' => 'Betting amount must be a number',
            'betting_amount.between' => 'Betting amount must be between 0 and 9999999999999.99',
            'description.required' => 'Description is required',
            'description.max' => 'Description cannot exceed 255 characters',
        ]);

        // If validation fails, return error response
        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation error',
                'errors' => $validator->errors()
            ], 422);
        }

        // Create a new Betting instance
        $betting = new Betting;
        $betting->betting_amount = $request->input('betting_amount');
        $betting->description = $request->input('description'); 
		$betting->added_by = $request->input('added_by') === "on" ? true : false;
		
        $betting->save();

        // Return success response
        return response()->json([
            'status' => 'success',
            'message' => 'Betting record created successfully',
            'betting' => $betting
        ], 201); // HTTP status code for resource created

    } catch (\Exception $e) {
        // Log the error
        Log::error('Error creating betting record: ' . $e->getMessage());

        // Return error response
        return response()->json([
            'status' => 'error',
            'message' => 'An error occurred while creating the betting record.'
        ], 500);
    }
}

public function UpdateBettingMaster(Request $request)
{
    try {
        // Find the Betting record by ID
        $betting = Betting::find($request->id);

        // Check if the record exists
        if (!$betting) {
            return response()->json([
                'status' => 'error',
                'message' => 'Betting record not found.'
            ], 404);
        }

        // Validate the request data
        $validator = Validator::make($request->all(), [
            'betting_amount' => 'required|numeric|between:0,9999999999999.99',
            'description' => 'required|max:255',
        ], [
            'betting_amount.required' => 'Betting amount is required',
            'betting_amount.numeric' => 'Betting amount must be a number',
            'betting_amount.between' => 'Betting amount must be between 0 and 9999999999999.99',
            'description.required' => 'Description is required',
            'description.max' => 'Description cannot exceed 255 characters',
        ]);

        // If validation fails, return error response
        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation error',
                'errors' => $validator->errors()
            ], 422);
        }

        // Update the Betting record
        $betting->betting_amount = $request->input('betting_amount');
        $betting->description = $request->input('description');
        $betting->save();

        // Return success response
        return response()->json([
            'status' => 'success',
            'message' => 'Betting record updated successfully',
            'betting' => $betting
        ], 200);

    } catch (\Exception $e) {
        // Log the error
        Log::error('Error updating betting record: ' . $e->getMessage());

        // Return error response
        return response()->json([
            'status' => 'error',
            'message' => 'An error occurred while updating the betting record.'
        ], 500);
    }
}

	public function destroy($id)
    {
        $betting = Betting::find($id);
        $betting->delete();
        return redirect()->back()->with('status','Record Deleted Successfully');
    }
}
