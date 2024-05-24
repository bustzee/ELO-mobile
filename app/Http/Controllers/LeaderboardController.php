<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use App\Models\Livestream;
use Illuminate\Http\Request;
use App\CustomClasses\Api_Helper;
use Illuminate\Support\Facades\Log;

class LeaderboardController extends Controller
{
    public function index(Request $request)
    {
        $homeLikeCount = env('STREAM_HOME_lIKE_COUNT');
        $homePotAmount = env('STREAM_HOME_POT_AMOUNT');

        // 
        $minViewers = env('TWITCH_MIN_VIEWERS');
        $likeCount = env('TWITCH_lIKE_COUNT');
        $potAmount = env('TWITCH_POT_AMOUNT');



        $livestreamsQuery = Livestream::with('user')
        ->whereNull('livestreams.type') 
        ->whereNot('livestreams.status', 'stopped') 
        ->whereDoesntHaveReports()
        ->select('livestreams.*')
        ->leftJoin('livestream_likes', 'livestreams.id', '=', 'livestream_likes.livestream_id')
        ->leftJoin('bets', 'livestreams.id', '=', 'bets.game_id')
        ->selectRaw('livestreams.*, 
                     COUNT(livestream_likes.id) as like_count,
                     SUM(bets.total_amount) as pot_amount')
        ->groupBy('livestreams.id')
        ->having('like_count', '>', $homeLikeCount)
        ->havingRaw('pot_amount > ?', [$homePotAmount])    
        ->orderByDesc('like_count') 
        ->orderByDesc('pot_amount');
      
        $livestreams = $livestreamsQuery->get();

      
        $setting = Setting::find(1);

        if ($setting && !$setting->hide_twitch_stream) {
            $headers = [
                "Authorization: Bearer jv1cwosrnqvcvw1354cj6dq89n3be4",
                "Client-Id: 43s48r8zwlgnvwpk5xsc1gk7efa3js",
                "Content-Type: application/json"
            ];

           
            $url = "https://api.twitch.tv/helix/streams?game_id=516575&game_id=32399&game_id=33214&game_id=27471&game_id=1494&first=12";
            $APIHELPER = new Api_Helper($url, $headers, true, true);
            $response = $APIHELPER->CallApi();

            $leaderboardLivestreams = [];

            if ($response && isset($response['data'])) {
                foreach ($response['data'] as $stream) {
                    if ($stream['viewer_count'] > $minViewers) {
                        $livestream = Livestream::firstOrNew(['stream_id' => $stream['id'], 'type' => 'twitch']);
    
                        if ($livestream->getPotAmount() >= $potAmount && $livestream->getLikeCount() >= $likeCount) {
                            $leaderboardLivestreams[] = [
                                'stream' => $stream,
                                'user_id' => $stream['user_id'],
                                'like_count' => $livestream->getLikeCount(),
                                'pot_amount' => $livestream->getPotAmount()
                            ];
                        }
                    }
                }
            }

            // dd($leaderboardLivestreams);

        
            return view('live.leaderboard', compact('livestreams', 'leaderboardLivestreams'));
        }

       
        return view('live.leaderboard', compact('livestreams'));
    }


    public function getHomeLeaderBoardStreams(Request $request)
    {
        try {
            $homeLikeCount = env('STREAM_HOME_lIKE_COUNT', 0);
            $homePotAmount = env('STREAM_HOME_POT_AMOUNT', 0);

            $livestreams = Livestream::with('user')
                ->whereNull('livestreams.type')
                ->where('livestreams.status', '!=', 'stopped')
                ->whereDoesntHaveReports()
                ->leftJoin('livestream_likes', 'livestreams.id', '=', 'livestream_likes.livestream_id')
                ->leftJoin('bets', 'livestreams.id', '=', 'bets.game_id')
                ->selectRaw('livestreams.*, COUNT(livestream_likes.id) as like_count, SUM(bets.total_amount) as pot_amount')
                ->groupBy('livestreams.id')
                ->having('like_count', '>', $homeLikeCount)
                ->havingRaw('pot_amount > ?', [$homePotAmount])
                ->orderByDesc('like_count')
                ->orderByDesc('pot_amount')
                ->get();

                if ($livestreams->isEmpty()) {
                    return response()->json([
                        'status' => 'success',
                        'message' => 'No streams available.'
                    ]);
                }

            return response()->json([
                'status' => 'success',
                'data' => $livestreams
            ]);
        } catch (\Exception $e) {
            Log::error('Error fetching home leaderboard streams: ' . $e->getMessage());
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to fetch home leaderboard streams.'
            ], 500);
        }
    }

    public function getTwitchLeaderBoardStreams(Request $request)
    {
        try {
            $minViewers = env('TWITCH_MIN_VIEWERS', 0);
            $likeCount = env('TWITCH_lIKE_COUNT', 0);
            $potAmount = env('TWITCH_POT_AMOUNT', 0);

            $setting = Setting::find(1);
            $leaderboardLivestreams = [];

            if ($setting && !$setting->hide_twitch_stream) {
                $headers = [
                    "Authorization: Bearer jv1cwosrnqvcvw1354cj6dq89n3be4",
                    "Client-Id: 43s48r8zwlgnvwpk5xsc1gk7efa3js",
                    "Content-Type: application/json"
                ];

                $url = "https://api.twitch.tv/helix/streams?game_id=516575&game_id=32399&game_id=33214&game_id=27471&game_id=1494&first=12";
                $APIHELPER = new Api_Helper($url, $headers, true, true);
                $response = $APIHELPER->CallApi();

                if ($response && isset($response['data'])) {
                    foreach ($response['data'] as $stream) {
                        if ($stream['viewer_count'] > $minViewers) {
                            $livestream = Livestream::firstOrNew(['stream_id' => $stream['id'], 'type' => 'twitch']);

                            if ($livestream->getPotAmount() >= $potAmount && $livestream->getLikeCount() >= $likeCount) {
                                $leaderboardLivestreams[] = [
                                    'stream' => $stream,
                                    'user_id' => $stream['user_id'],
                                    'like_count' => $livestream->getLikeCount(),
                                    'pot_amount' => $livestream->getPotAmount()
                                ];
                            }
                        }
                    }
                }
            }
            
            if (empty($leaderboardLivestreams)) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'No Twitch streams available.'
                ]);
            }
            return response()->json([
                'status' => 'success',
                'data' => $leaderboardLivestreams
            ]);
        } catch (\Exception $e) {
            Log::error('Error fetching Twitch leaderboard streams: ' . $e->getMessage());
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to fetch Twitch leaderboard streams.'
            ], 500);
        }
    }
}
