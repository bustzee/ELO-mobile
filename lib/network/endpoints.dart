class Endpoints {
  Endpoints._();

  static const String baseURL = 'https://elo-api.takshmahajan.in/api/';
  static const String domain = 'https://elo-api.takshmahajan.in/';

  static const int receiveTimeout = 5000;

  static const int connectionTimeout = 3000;

  static const String getLiveStreams = 'GetLiveStreams';
  static const String getCompletedStreams = 'GetCompletedStreams';
  static const String getTwitchStreams = 'GetTwitchStreams';
  static const String getUserDetails = 'GetUserDetails';
  static const String getUsersList = 'getUsersList';
  static const String getAllRoles = 'getAllRoles';
  static const String showPermission = 'showPermission';
  static const String updateBankDetails = 'UpdateBankDetails';
  static const String createStream = 'CreateStream';
  static const String createUser = 'CreateUser';
  static const String getTutorial = 'getTutorial';
  static const String getListOfWithdrawals = 'GetListOfWithdrawals';
  static const String getListOfDeposits = 'GetListOfDeposits';
  static const String likeStream = 'LikeStream';
  static const String unlikeStream = 'UnlikeStream';
  static const String streamReport = 'StreamReport';
  static const String getStreamDetails = 'GetStreamDetails';
  static const String getHomeLeaderBoardStreams = 'getHomeLeaderBoardStreams';
  static const String getTwitchLeaderBoardStreams =
      'getTwitchLeaderBoardStreams';
  static const String updateSettings = 'UpdateSettings';
  static const String createBettingMaster = 'CreateBettingMaster';
  static const String getListOfBettingMaster = 'GetListOfBettingMaster';
  static const String deleteBettingMasterRecord = 'DeleteBettingMasterRecord';
  static const String createBettingViewMaster = 'createBettingViewMaster';
  static const String getListOfBettingViewMaster = 'getListOfBettingViewMaster';
  static const String deleteBettingViewMasterRecord =
      'deleteBettingViewMasterRecord';
  static const String getDashboardInfo = 'getDashboardInfo';
  static const String deleteTutorial = 'deleteTutorial';
  static const String createTutorial = 'createTutorial';
  static const String getReportedStreams = 'GetReportedStreams';
  static const String getBettingDisputes = 'GetBettingDisputes';
  static const String getSetting = 'getSetting';
  static const String getBetDetails = 'GetBetDetails';
  static const String addBet = 'AddBet';
  static const String getBetbyuserId = 'getBetbyuserId';
  static const String getStreamingReport = 'GetStreamingReport';
  static const String updateBettingMaster = 'UpdateBettingMaster';
  static const String deleteRole = 'DeleteRole';
  static const String updateTutorial = 'updateTutorial';
}
