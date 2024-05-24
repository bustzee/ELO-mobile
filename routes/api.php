<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BetController;
use App\Http\Controllers\StreamController;
use App\Http\Controllers\MyBetsController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\MyStreamsController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\LeaderboardController;
use App\Http\Controllers\Admin\ReportController;
use App\Http\Controllers\Admin\BettingController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\TutorialController;
use App\Http\Controllers\Admin\BettingViewController;
use App\Http\Controllers\LiveStream\LiveStreamController;
use App\Http\Controllers\Admin\LiveStreamn\LiveStreamIndex;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
// $baseUrl = env('API_BASE_URL');

Route::controller(AuthController::class)->group(function () {
    Route::post('GetUserDetails', 'GetUserDetails');
    Route::post('CreateUser', 'CreateUser');
    Route::post('logout', 'logout');
    Route::post('refresh', 'refresh');
});
Route::get('/GetLiveStreams', [\App\Http\Controllers\IndexController::class, 'GetLiveStreams']);
Route::get('/GetTwitchStreams', [\App\Http\Controllers\IndexController::class, 'GetTwitchStreams']);
Route::get('/getTutorial',  [TutorialController::class, 'getTutorial']);
Route::post('/GetStreamDetails',  [LiveStreamController::class, 'GetStreamDetails']);
Route::get('/getHomeLeaderBoardStreams',  [LeaderboardController::class, 'getHomeLeaderBoardStreams']);
Route::get('/getTwitchLeaderBoardStreams',  [LeaderboardController::class, 'getTwitchLeaderBoardStreams']);

Route::post('/getTwitchStreamDetails', [StreamController::class, 'getTwitchStreamDetails']);

Route::middleware('auth:api')->get('/GetMyStreams',  [ProfileController::class, 'GetMyStreams']);
Route::middleware('auth:api')->get('/GetMyStreams',  [LiveStreamIndex::class, 'GetMyStreams']);
Route::middleware('auth:api')->get('/GetListOfDeposits',  [ProfileController::class, 'GetListOfDeposits']);
Route::middleware('auth:api')->post('/UpdateBankDetails',  [ProfileController::class, 'UpdateBankDetails']);
Route::middleware('auth:api')->post('/CreateStream',  [LiveStreamController::class, 'CreateStream']);
Route::middleware('auth:api')->get('/GetMyStreams',  [MyStreamsController::class, 'GetMyStreams']);
Route::middleware('auth:api')->get('/GetMyBettings',  [MyStreamsController::class, 'GetMyBettings']);
Route::middleware('auth:api')->get('/GetMyTransactions',  [MyBetsController::class, 'GetMyTransactions']);
Route::middleware('auth:api')->get('/GetMyELOBalance',  [ProfileController::class, 'GetMyELOBalance']);
Route::middleware('auth:api')->get('/GetListOfWithdrawals',  [ProfileController::class, 'GetListOfWithdrawals']);
Route::middleware('auth:api')->post('/AddBet',  [BetController::class, 'AddBet']);
Route::middleware('auth:api')->post('/GetBetDetails',  [BetController::class, 'getBetDetails']);
Route::middleware('auth:api')->post('/StreamReport',  [LiveStreamController::class, 'StreamReport']);
Route::middleware('auth:api')->post('/LikeStream',  [LiveStreamController::class, 'LikeStream']);
Route::middleware('auth:api')->post('/ClaimBet',  [BetController::class, 'ClaimBet']);

// admin
Route::middleware('auth:api')->get('/getDashboardInfo',  [AuthController::class, 'getDashboardInfo']);
Route::middleware('auth:api')->get('/getLivestreams',  [LiveStreamIndex::class, 'getLivestreams']);
Route::middleware('auth:api')->get('/GetCompletedStreams',  [LiveStreamIndex::class, 'GetCompletedStreams']);
Route::middleware('auth:api')->get('/getUsersList',  [UserController::class, 'getUsersList']);
Route::middleware('auth:api')->post('/AssignRole',  [UserController::class, 'AssignRole']);
Route::middleware('auth:api')->post('/UpdateUserStatus',  [UserController::class, 'UpdateUserStatus']);
Route::middleware('auth:api')->get('/GetListOfAdminUsers',  [UserController::class, 'GetListOfAdminUsers']);
Route::middleware('auth:api')->post('/CreateRole',  [RoleController::class, 'CreateRole']);
Route::middleware('auth:api')->put('/UpdateRole', [RoleController::class, 'UpdateRole']);
Route::middleware('auth:api')->delete('/DeleteRole', [RoleController::class, 'DeleteRole']);
Route::middleware('auth:api')->get('/showPermission',  [RoleController::class, 'showPermission']);
Route::middleware('auth:api')->post('/CreateSettings',  [SettingController::class, 'CreateSettings']);
Route::middleware('auth:api')->put('/UpdateSettings',  [SettingController::class, 'UpdateSettings']);
Route::middleware('auth:api')->post('/CreateBettingMaster',  [BettingController::class, 'CreateBettingMaster']);
Route::middleware('auth:api')->put('/UpdateBettingMaster',  [BettingController::class, 'UpdateBettingMaster']);
Route::middleware('auth:api')->get('/GetListOfBettingMaster',  [BettingController::class, 'GetListOfBettingMaster']);
Route::middleware('auth:api')->delete('/DeleteBettingMasterRecord',  [BettingController::class, 'DeleteBettingMasterRecord']);
Route::middleware('auth:api')->get('/getListOfBettingViewMaster',  [BettingViewController::class, 'getListOfBettingViewMaster']);
Route::middleware('auth:api')->post('/createBettingViewMaster',  [BettingViewController::class, 'createBettingViewMaster']);
Route::middleware('auth:api')->put('/updateBettingViewMaster',  [BettingViewController::class, 'updateBettingViewMaster']);
Route::middleware('auth:api')->delete('/deleteBettingViewMasterRecord',  [BettingViewController::class, 'deleteBettingViewMasterRecord']);
Route::middleware('auth:api')->post('/createTutorial',  [TutorialController::class, 'createTutorial']);
Route::middleware('auth:api')->put('/updateTutorial',  [TutorialController::class, 'updateTutorial']);
Route::middleware('auth:api')->delete('/deleteTutorial',  [TutorialController::class, 'deleteTutorial']);
Route::middleware('auth:api')->post('/GetStreamingReport',  [LiveStreamIndex::class, 'GetStreamingReport']);
Route::middleware('auth:api')->get('/GetReportedStreams',  [ReportController::class, 'GetReportedStreams']);
Route::middleware('auth:api')->get('/GetBettingDisputes',  [ReportController::class, 'GetBettingDisputes']);
Route::middleware('auth:api')->post('/UnlikeStream',  [LiveStreamController::class, 'UnlikeStream']);
Route::middleware('auth:api')->post('/getBetbyuserId',  [BetController::class, 'getBetbyuserId']);
Route::middleware('auth:api')->get('/getAllRoles',  [RoleController::class, 'getAllRoles']);
Route::middleware('auth:api')->get('/getSetting',  [SettingController::class, 'getSetting']);


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/stream/on_publish', [\App\Http\Controllers\LiveStream\LiveStreamController::class, 'onPublish']);


Route::post('/stream/on_stop', [\App\Http\Controllers\LiveStream\LiveStreamController::class, 'onrmptStop']);
//

Route::post('/message', [\App\Http\Controllers\MessageController::class, 'broadcast']);



	/*  stream  api to send new name */
Route::post('/stream-api',[\App\Http\Controllers\LiveStream\LiveStreamController::class, 'renameStreamApi']);    
	

