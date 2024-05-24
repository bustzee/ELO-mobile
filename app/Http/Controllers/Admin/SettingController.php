<?php

namespace App\Http\Controllers\Admin;

use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Validator;

class SettingController extends Controller
{
    //
    public function index()
    {

        $setting=Setting::find(1);// get
        return view('backend.setting', compact('setting'));
    }

    public function saveSetting(Request $request)
    {

        $validator_data=$request->validate(
            [
        'vig'	=> 'required|decimal:0,2|max:100',  // validare function
        'extra_vig_division_factor'	=> 'required|integer|max:20|min:1',  // validare function
        'streamer_per'	=> 'required|decimal:0,2|max:20',  // validare function
        'no_of_user_can_bet'	=> 'required|integer|min:1',  // validare function
        'min_wallet_trasfer_amount'	=> 'required|decimal:0,2' , // validare function
        'client_id'	=> 'required',  // validare function
        'api_username'	=> 'required',  // validare function
        'api_password'	=> 'required',  // validare function
        'api_signature'	=> 'required',  // validare function
        'environment'	=> 'required',  // validare function
        ],
            [
        'vig.required'=>'Vig required',
        'vig.decimal'=>'Vig must be decimal',
        'vig.max'=>'Vig must be less than 100',
        'extra_vig_division_factor.required'=>'Extra Vig Division Factor required',
        'extra_vig_division_factor.integer'=>'Extra Vig Division Factor must be numberic',
        'extra_vig_division_factor.max'=>'Extra Vig Division Factor must be less than 20',
        'extra_vig_division_factor.min'=>'Extra Vig Division Factor must be greater than 1',
        'streamer_per.required'=>'Streamer Percentage required',
        'streamer_per.decimal'=>'Streamer Percentage must be decimal',
        'streamer_per.max'=>'Streamer Percentage  must be less than 20',
        'no_of_user_can_bet.required'=>'No. of user can bet Factor required',
        'no_of_user_can_bet.integer'=>'No. of user can bet must be numberic',
        'no_of_user_can_bet.min'=>'No. of user can bet must be greater than 1',
        'min_wallet_trasfer_amount.required'=>'Minimum Wallet Transfer Amount required',
        'min_wallet_trasfer_amount.decimal'=>'Minimum Wallet Transfer Amount must be decimal',
        'client_id.required'=>'Client Id required',
        'api_username.required'=>'Api Username required',
        'api_password.required'=>'Api Password required',
        'api_signature.required'=>'Api Signature required',
        'environment.required'=>'Environment required'
        ]
        );



        $setting=Setting::find(1);// get
// dd($request->input('hide_twitch_stream') === "on" ? true : false);
        $setting->vig = $request->input('vig');
        $setting->extra_vig_division_factor = $request->input('extra_vig_division_factor');
        $setting->no_of_user_can_bet = $request->input('no_of_user_can_bet');
        $setting->streamer_per = $request->input('streamer_per');
        $setting->min_wallet_trasfer_amount = $request->input('min_wallet_trasfer_amount');
        $setting->client_id = Crypt::encryptString($request->input('client_id'));
        $setting->api_username = Crypt::encryptString($request->input('api_username'));
        $setting->api_password = Crypt::encryptString($request->input('api_password'));
        $setting->api_signature = Crypt::encryptString($request->input('api_signature'));
        $setting->environment = $request->input('environment');
        $setting->hide_twitch_stream = $request->input('hide_twitch_stream') === "on" ? true : false;
        $setting->save();
        return redirect()->back()->with('status', 'Setting Updated Successfully');
    }




    public function CreateSettings(Request $request)
{
    try {
        // Validate the request data
        $validator = Validator::make($request->all(), [
            'vig' => 'required|numeric|between:0,100',
            'extra_vig_division_factor' => 'required|integer|between:1,20',
            'streamer_per' => 'required|numeric|between:0,20',
            'no_of_user_can_bet' => 'required|integer|min:1',
            'min_wallet_trasfer_amount' => 'required|numeric|between:0,999999999.99',
            'client_id' => 'required',
            'api_username' => 'required',
            'api_password' => 'required',
            'api_signature' => 'required',
            'environment' => 'required',
        ]);
        
        // If validation fails, return error response
        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation error',
                'errors' => $validator->errors()
            ], 422);
        }

        // Find the setting record
        $setting = Setting::findOrFail(1);

        // Update setting properties
        $setting->vig = $request->input('vig');
        $setting->extra_vig_division_factor = $request->input('extra_vig_division_factor');
        $setting->no_of_user_can_bet = $request->input('no_of_user_can_bet');
        $setting->streamer_per = $request->input('streamer_per');
        $setting->min_wallet_trasfer_amount = $request->input('min_wallet_trasfer_amount');
        $setting->hide_twitch_stream = $request->input('hide_twitch_stream') === "on" ? true : false;
        $setting->client_id = Crypt::encryptString($request->input('client_id'));
        $setting->api_username = Crypt::encryptString($request->input('api_username'));
        $setting->api_password = Crypt::encryptString($request->input('api_password'));
        $setting->api_signature = Crypt::encryptString($request->input('api_signature'));
        $setting->environment = $request->input('environment');
        $setting->hide_twitch_stream = $request->input('hide_twitch_stream') === "on" ? true : false;

        // Save the setting
        $setting->save();

        // Return success response
        return response()->json([ 
            'status' => 'success',
            'message' => 'Setting created successfully',
            'setting' => $setting
        ], 200);

    } catch (\Exception $e) {
        // Log the error
        Log::error('Error updating setting: ' . $e->getMessage());

        // Return error response
        return response()->json([
            'status' => 'error',
            'message' => 'An error occurred while updating the setting.'
        ], 500);
    }
}


public function UpdateSettings(Request $request)
{
    try {
        // Validate the request data
        $validator = Validator::make($request->all(), [
            'vig' => 'required|numeric|between:0,100',
            'extra_vig_division_factor' => 'required|integer|between:1,20',
            'streamer_per' => 'required|numeric|between:0,20',
            'no_of_user_can_bet' => 'required|integer|min:1',
            'min_wallet_trasfer_amount' => 'required|numeric|between:0,999999999.99',
            'client_id' => 'required',
            'api_username' => 'required',
            'api_password' => 'required',
            'api_signature' => 'required',
            'environment' => 'required',
        ]);
        
        // If validation fails, return error response
        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation error',
                'errors' => $validator->errors()
            ], 422);
        }

        // Find the setting record
        $setting = Setting::findOrFail(1);

        // Update setting properties
        $setting->vig = $request->input('vig');
        $setting->extra_vig_division_factor = $request->input('extra_vig_division_factor');
        $setting->no_of_user_can_bet = $request->input('no_of_user_can_bet');
        $setting->streamer_per = $request->input('streamer_per');
        $setting->min_wallet_trasfer_amount = $request->input('min_wallet_trasfer_amount');
        $setting->hide_twitch_stream = $request->input('hide_twitch_stream') === "on" ? true : false;
        $setting->client_id = Crypt::encryptString($request->input('client_id'));
        $setting->api_username = Crypt::encryptString($request->input('api_username'));
        $setting->api_password = Crypt::encryptString($request->input('api_password'));
        $setting->api_signature = Crypt::encryptString($request->input('api_signature'));
        $setting->environment = $request->input('environment');

        // Save the setting
        $setting->save();

        // Return success response
        return response()->json([ 
            'status' => 'success',
            'message' => 'Setting updated successfully',
            'setting' => $setting
        ], 200);

    } catch (\Exception $e) {
        // Log the error
        Log::error('Error updating setting: ' . $e->getMessage());

        // Return error response
        return response()->json([
            'status' => 'error',
            'message' => 'An error occurred while updating the setting.'
        ], 500);
    }
}

public function getSetting()
{
    try {
        // Attempt to retrieve the setting
        $setting = Setting::find(1);

        // Check if the setting exists
        if (!$setting) {
            throw new \Exception('Setting not found.');
        }

        // Return success response with the setting data
        return response()->json([
            'status' => 'success',
            'data' => $setting,
        ], 200);
    } catch (\Exception $e) {
        // Log the exception
        Log::error('Error retrieving setting: ' . $e->getMessage());

        // Return error response
        return response()->json([
            'status' => 'error',
            'message' => 'Failed to retrieve setting.',
        ], 500);
    }
}


}
