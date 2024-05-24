<?php

namespace App\Http\Controllers;
use DB;
use Session;
use App\Models\Bet;
use App\Models\Users;
use App\Models\Setting;
use App\Models\Deposite;
use App\Models\Tutorial;
use App\Models\Livestream;
use Illuminate\Http\Request;
use App\Models\UserBankDetail;
use App\Models\WalletTransaction;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class ProfileController extends Controller
{
    public function index(Request $request,$open_popup=0)
    {
        $profile = auth()->user();
        $setting=Setting::find(1);// get setting
        
        $id = $profile->id;
        $bets = Bet::where('user_id', $id)->orderBy('created_at', 'desc')->get();

        $u_name = Users::where('Email', $profile->email)->get()->pluck('Username');
        
        $deposits = WalletTransaction::where('user_id', $id)->where('transaction_type', 'credit')->orderBy('created_at', 'desc')->limit(5)->get();
        $withdrawls = WalletTransaction::where('user_id', $id)->where('transaction_type', 'debit')->orderBy('created_at', 'desc')->limit(5)->get();
        //        $conversion = \DB::table('conversion')->first();
        $bank_details = UserBankDetail::where("user_id",auth()->id())->first();

        $livestreamsQuery = Livestream::with('user')
            ->whereNull('type')
            ->whereNot('status', 'stopped');

        if ($request->has('q')) {
            $search = $request->input('q');
            $livestreamsQuery->where(function($query) use ($search) {
                $query->where('livestreams.name', 'like', '%' . $search . '%')
                      ->orWhere('livestreams.description', 'like', '%' . $search . '%')
                      ->orWhereHas('user', function($userQuery) use ($search) {
                          $userQuery->where('username', 'like', '%' . $search . '%');
                      });
            });
        }

        $livestreams = $livestreamsQuery->get();
         $tutorials = Tutorial::orderBy('id','desc')->get();
        return view('profile', compact('profile', 'bets', 'withdrawls', 'deposits', 'setting', 'open_popup','bank_details','livestreams','tutorials'));

    }

public function GetMyStreams(Request $request, $open_popup = 0)
{
    try {
        $profile = auth()->user();
        $setting = Setting::find(1);

        // Get user ID
        $id = $profile->id;

        // Fetch bets
        $bets = Bet::where('user_id', $id)->orderBy('created_at', 'desc')->get();

        // Fetch deposits
        $deposits = WalletTransaction::where('user_id', $id)
            ->where('transaction_type', 'credit')
            ->orderBy('created_at', 'desc')
            ->limit(5)
            ->get();

        // Fetch withdrawals
        $withdrawls = WalletTransaction::where('user_id', $id)
            ->where('transaction_type', 'debit')
            ->orderBy('created_at', 'desc')
            ->limit(5)
            ->get();

        // Fetch bank details
        $bank_details = UserBankDetail::where("user_id", auth()->id())->first();

        // Query livestreams
        $livestreamsQuery = Livestream::with('user')
            ->where('user_id', $id)
            ->whereNull('type')
            ->whereNot('status', 'stopped');

        // Apply search filter if present
        if ($request->has('q')) {
            $search = $request->input('q');
            $livestreamsQuery->where(function ($query) use ($search) {
                $query->where('name', 'like', '%' . $search . '%')
                    ->orWhere('description', 'like', '%' . $search . '%')
                    ->orWhereHas('user', function ($userQuery) use ($search) {
                        $userQuery->where('username', 'like', '%' . $search . '%');
                    });
            });
        }

        // Fetch livestreams
        $livestreams = $livestreamsQuery->orderBy('created_at', 'desc')->get();

        // Fetch tutorials
        $tutorials = Tutorial::orderBy('id', 'desc')->get();

        return response()->json([
            'success' => true,
            'profile' => $profile,
            'bets' => $bets,
            'deposits' => $deposits,
            'withdrawls' => $withdrawls,
            'setting' => $setting,
            'open_popup' => $open_popup,
            'bank_details' => $bank_details,
            'livestreams' => $livestreams,
            'tutorials' => $tutorials
        ]);
    } catch (\Exception $e) {
        Log::error('Error fetching profile data: ' . $e->getMessage());
        return response()->json([
            'success' => false,
            'error' => 'An error occurred while fetching profile data.'
        ], 500);
    }
}
public function GetListOfWithdrawals(Request $request)
{
    try {
        // Authenticate the user
        $user = auth()->user();
        if (!$user) {
            return response()->json(['status' => 'error', 'message' => 'Unauthorized'], 401);
        }

        // Fetch the authenticated user's email
        $userEmail = $user->email;

        // Query user's withdrawal transactions
        $withdrawals = WalletTransaction::select('comment', 'transaction_amount', 'transaction_id', 'transaction_type', 'created_at as On Date')
            ->where('user_id', $user->id)
            ->where('transaction_type', 'debit')
            ->orderBy('created_at', 'desc')
            ->get();

        // Transform the withdrawal transactions data
        $transformedWithdrawals = $withdrawals->map(function ($withdrawal) use ($userEmail) {
            return [
                'Comment' => $withdrawal->comment ?? 'N/A',
                'transaction_amount' => $withdrawal->transaction_amount,
                'Transaction Id / Email Id' => $withdrawal->transaction_id ?? $userEmail,
                'Type' => $withdrawal->transaction_type,
                'On Date' => $withdrawal->created_at ? $withdrawal->created_at->format('Y-m-d H:i:s') : 'N/A',
            ];
        });

        // Return success response with withdrawal transactions data
        return response()->json(['status' => 'success', 'withdrawals' => $transformedWithdrawals]);

    } catch (\Exception $e) {
        // Log the exception
        \Log::error('Error fetching withdrawal transactions: ' . $e->getMessage());

        // Return error response
        return response()->json(['status' => 'error', 'message' => 'Failed to fetch withdrawal transactions.'], 500);
    }
}

public function GetMyELOBalance()
{
    try {
        $profile = auth()->user();
        // Get user ID
        $elo = $profile->elo_balance;

        return response()->json([
            'success' => true,
            'ELO Balance' => $elo,
          
        ]);
    } catch (\Exception $e) {
        Log::error('Error fetching profile data: ' . $e->getMessage());
        return response()->json([
            'success' => false,
            'error' => 'An error occurred while fetching elo balance data.'
        ], 500);
    }
}

    public function updateUserBankDetails(Request $request)
    {
        // Validate the request data
        $request->validate([
            'bank_name' => 'required|string|max:255',
            'account_number' => 'required|string|max:20',
            'routing_number' => 'required|string|max:20',
            
        ]);

      
        // If validation passes, create a new UserBankDetail instance and save it
       
        
		$userBankDetail =  UserBankDetail::where("user_id",auth()->user()->id)->first();
		if(empty($userBankDetail)){
			 $userBankDetail = new UserBankDetail();
		}
		
        $userBankDetail->user_id = auth()->user()->id;
        $userBankDetail->bank_name = $request->bank_name;
        $userBankDetail->account_number = $request->account_number;
        $userBankDetail->branch_name = $request->branch_name;
        $userBankDetail->ifsc_code = $request->ifsc_code;
        $userBankDetail->micr_code = $request->micr_code;
        $userBankDetail->swift_code = $request->swift_code;
        $userBankDetail->routing_number = $request->routing_number;
        
        $userBankDetail->save();

         // Flash success message to the session
        Session::flash('success', 'Bank details saved successfully.');

        // Redirect the user to a success page or wherever appropriate
        return redirect()->route('profile');

    }

    public function GetListOfDeposits(Request $request)
{
    try {
        $profile = auth()->user();
        $id = $profile->id;

        // Query deposits from the WalletTransaction table
        $deposits = WalletTransaction::where('user_id', $id)
            ->where('transaction_type', 'credit')
            ->get();

        // Define an array to store formatted deposit information
        $formattedDeposits = [];

        // Iterate through each deposit and extract required details
        foreach ($deposits as $deposit) {
            // Format the deposit date
            $formattedDate = $deposit->created_at->format('Y-m-d H:i:s');

            // Push formatted deposit details into the array
            $formattedDeposits[] = [
                'Deposited Amount' => $deposit->transaction_amount,
                'Transaction Id' => $deposit->transaction_id,
                'Status' => $deposit->comment,
                'Date' => $formattedDate,
            ];
        }

        // Return success response with formatted deposit information
        return response()->json(['status' => 'success', 'deposits' => $formattedDeposits]);

    } catch (\Exception $e) {
        // Log the exception
        Log::error('Error retrieving deposits: ' . $e->getMessage());

        // Return error response
        return response()->json(['status' => 'error', 'message' => 'Failed to retrieve deposits.']);
    }
}
    

public function UpdateBankDetails(Request $request)
{
    try {
        // Validate the request data
        $validator = Validator::make($request->all(), [
            'bank_name' => 'required|string|max:255',
            'account_number' => 'required|string|max:20',
            'routing_number' => 'required|string|max:20',
        ]);

        // If validation fails, return error response
        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->errors()], 400);
        }

        // Find or create the user's bank details
        $userBankDetail = UserBankDetail::firstOrNew(['user_id' => auth()->user()->id]);

        // Fill the user's bank details
        $userBankDetail->fill($request->only([
            'bank_name', 'account_number', 'branch_name', 'ifsc_code', 'micr_code', 'swift_code', 'routing_number'
        ]));

        // Save the user's bank details
        $userBankDetail->save();

        // Return success response
        return response()->json(['status' => 'success', 'message' => 'Bank details saved successfully.'], 200);
    } catch (\Exception $e) {
        // Log error and return error response
        Log::error('Error updating user bank details: ' . $e->getMessage());
        return response()->json(['status' => 'error', 'message' => 'Failed to update user bank details'], 500);
    }
}



    

}
