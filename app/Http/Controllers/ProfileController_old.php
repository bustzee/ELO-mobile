<?php

namespace App\Http\Controllers;
use App\Models\Users;
use Session;
use DB;
use App\Models\Bet;
use App\Models\Deposite;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function index()
    {
        $email = Session::get('userid');
        $profile = Users::where('Email',$email)->first();

        $id =  $profile->id;
        $bets = Bet::where('user_id',$id)->orderBy('created_at', 'desc')->get();

        $u_name = Users::where('Email',$email)->get()->pluck('Username');
        $deposits = Deposite::where('username',$u_name)->orderBy('created_at', 'desc')->get();

        return view('profile',compact('profile','bets','deposits'));
    }

    public function GetMyStreams()
{
    try {
        $email = Session::get('userid');
        $profile = Users::where('Email', $email)->first();

        if (!$profile) {
            return response()->json(['error' => 'User profile not found.'], 404);
        }

        $id = $profile->id;
        $bets = Bet::where('user_id', $id)->orderBy('created_at', 'desc')->get();

        $u_name = $profile->Username; // Assuming Username is a column in the Users table
        $deposits = Deposite::where('username', $u_name)->orderBy('created_at', 'desc')->get();

        return response()->json([
            'profile' => $profile,
            'bets' => $bets,
            'deposits' => $deposits
        ]);
    } catch (\Exception $e) {
        Log::error('Error fetching profile data: ' . $e->getMessage());
        return response()->json(['error' => 'An error occurred while fetching profile data.'], 500);
    }
}
}
