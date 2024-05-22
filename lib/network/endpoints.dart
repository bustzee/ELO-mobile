class Endpoints {
  Endpoints._();

  static const String baseURL = 'https://elo-api.takshmahajan.in/api/';

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
}
