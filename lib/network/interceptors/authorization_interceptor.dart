import 'package:dio/dio.dart';
import 'package:elo_esports/models/user_details.dart';
import 'package:elo_esports/utilities/shared_preferences_utility.dart';





//* Request methods PUT, POST, PATCH, DELETE needs access token,
//* which needs to be passed with "Authorization" header as Bearer token.
class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
      UserDetails? user = await  SharedPreferencesService.getUserDetails();
      String apiKey = user?.data?.token ?? 'NA';
      
    if (_needAuthorizationHeader(options)) {
      options.headers['Authorization'] = 'Bearer $apiKey';
    }
    super.onRequest(options, handler);
  }

  bool _needAuthorizationHeader(RequestOptions options) {
    if (options.method == 'GET') {
      return true;
    } else {
      return true;
    }
  }
}
