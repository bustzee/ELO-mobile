import 'dart:convert';
import 'package:elo_esports/models/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setUserDetails(UserDetails userDetails) async {
    final json = userDetails.toJson();
    await _preferences.setString('user_details', jsonEncode(json));
  }

  static UserDetails? getUserDetails() {
    final userDetailsJson = _preferences.getString('user_details');
    if (userDetailsJson != null) {
      final json = jsonDecode(userDetailsJson);
      return UserDetails.fromJson(json);
    }
    return null;
  }
}