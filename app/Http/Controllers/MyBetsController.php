<?php
 
namespace App\Http\Controllers;
use App\Models\Bet;
use App\Models\BetMain;
use App\Models\Setting;
use App\Models\Livestream;
use Illuminate\Http\Request; 
use App\Models\WalletTransaction;
use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller; 

class MyBetsController extends Controller
{
   
 
	public function getMyBettingList(){ 
			$user_id=auth()->user()->id;  
			  $records = Bet::with(['betmain','livestreams'])->where('user_id', $user_id)->orderBy('id', 'desc')->paginate(10); 
		    return view('MyBets.index',  ['records' => $records  ]);
			
		}
	 
	 
	 public function getMyTransactionList(){ 
		$user_id=auth()->user()->id;  
			  $records = WalletTransaction::where('user_id', $user_id)->orderBy('created_at','desc')->paginate(10); 
		
		 
				return view('MyTranscation.index',  ['records' => $records  ]);
			
		}
	 

		public function GetMyTransactions(Request $request)
{
    try {
        // Authenticate the user
        $user = auth()->user();
        if (!$user) {
            return response()->json(['status' => 'error', 'message' => 'Unauthorized'], 401);
        }

        // Query user's transactions
        $transactions = WalletTransaction::where('user_id', $user->id)
            ->orderBy('created_at', 'desc')
            ->get();

        // Transform the transactions data
        $transformedTransactions = $transactions->map(function ($transaction) {
            return [
                'Comment' => $transaction->comment,
                'Amount' => $transaction->amount,
                'Transaction Id / Email Id' => $transaction->transaction_id ?? $transaction->email, // Assuming transaction_id and email are mutually exclusive
                'Type' => $transaction->transaction_type,
                'On Date' => $transaction->created_at->format('Y-m-d H:i:s'),
            ];
        });

        // Return success response with transformed transaction data
        return response()->json(['status' => 'success', 'transactions' => $transformedTransactions]);

    } catch (\Exception $e) {
        // Log the exception
        Log::error('Error fetching user transactions: ' . $e->getMessage());

        // Return error response
        return response()->json(['status' => 'error', 'message' => 'Failed to fetch user transactions.'], 500);
    }
}
 
 }
