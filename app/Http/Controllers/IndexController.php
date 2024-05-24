<?php

namespace App\Http\Controllers;

use App\CustomClasses\Api_Helper;
use App\Models\Livestream;
use App\Models\Setting;
use Illuminate\Http\Request;
use App\Models\Tutorial;
use Illuminate\Support\Facades\Log;

class IndexController extends Controller
{
    public function index(Request $request)
    {
        $setting = Setting::find(1);
        $data = null;
        $twitchLivestreams = collect();

        if (!$setting->hide_twitch_stream) {

            $headers = [
                "Authorization: Bearer jv1cwosrnqvcvw1354cj6dq89n3be4",
                "Client-Id: 43s48r8zwlgnvwpk5xsc1gk7efa3js",
                "Content-Type:application/json"
            ];
            $url = "https://api.twitch.tv/helix/streams?game_id=516575&game_id=32399&game_id=33214&game_id=27471&game_id=1494&first=12";
            $APIHELPER = new Api_Helper($url, $headers, true, true);
            $data = $APIHELPER->CallApi();


            if ($data && isset($data['data']) && is_array($data['data'])) {
                $twitchLivestreams = collect($data['data'])->filter(function ($stream) use ($request) {
                    $search = $request->input('q');
                    return stripos($stream['user_name'], $search) !== false
                        || stripos($stream['title'], $search) !== false
                        || stripos($stream['game_name'], $search) !== false;
                });
            }
        }


        $livestreamsQuery = Livestream::with('user')
            ->whereNull('type')
            ->whereNot('status', 'stopped');

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

        $livestreams = $livestreamsQuery->get();
        $tutorials = Tutorial::orderBy('id', 'desc')->get();

        return view('index', compact('livestreams', 'data', 'setting', 'tutorials', 'twitchLivestreams'));
    }

    public function showTutorialDocument($id)
    {

        $tutorial = Tutorial::where('id', $id)->first();
        return view('tutorial-document', compact('tutorial'));
    }


    // <============================ API ================================================>
    
    public function GetLiveStreams(Request $request)
    {
        try {
            $livestreamsQuery = Livestream::with('user')
                ->whereNull('type')
                ->whereNot('status', 'stopped');

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

            $livestreams = $livestreamsQuery->get();

            return response()->json([
                'status' => 'success',
                'livestreams' => $livestreams,
            ]);
        } catch (\Exception $e) {
            Log::error('Error fetching livestreams: ' . $e->getMessage());

            return response()->json([ 'status' => 'error','message' => 'An error occurred while fetching livestreams.'], 500);
        }
    }


    public function GetTwitchStreams(Request $request)
    {
        try {
            $setting = Setting::find(1);
            $twitchLivestreams = collect();

            if (!$setting->hide_twitch_stream) {
                // API Authentication
                $headers = [
                    "Authorization: Bearer jv1cwosrnqvcvw1354cj6dq89n3be4",
                    "Client-Id: 43s48r8zwlgnvwpk5xsc1gk7efa3js",
                    "Content-Type:application/json"
                ];


                // Define Twitch API URL
                $url = "https://api.twitch.tv/helix/streams?game_id=516575&game_id=32399&game_id=33214&game_id=27471&game_id=1494&first=12";

                // Call Twitch API
                $APIHELPER = new Api_Helper($url, $headers, true, true);
                $data = $APIHELPER->CallApi();

                if ($data && isset($data['data']) && is_array($data['data'])) {
                    $twitchLivestreams = collect($data['data']);
                }
            }

            return response()->json([
                'status' => 'success',
                'twitchLivestreams' => $twitchLivestreams,
            ]);
        } catch (\Exception $e) {
            Log::error('Error fetching Twitch livestreams: ' . $e->getMessage());
            return response()->json(['status' => 'error','message' => 'An error occurred while fetching Twitch livestreams.'], 500);
        }
    }
}
