import 'dart:convert';
import 'package:elo_esports/models/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> _getInstance() async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  static Future<void> setUserDetails(UserDetails userDetails) async {
    final prefs = await _getInstance();
    final json = userDetails.toJson();
    await prefs.setString('user_details', jsonEncode(json));
  }

  static Future<UserDetails?> getUserDetails() async {
    final prefs = await _getInstance();
    final userDetailsJson = prefs.getString('user_details');
    if (userDetailsJson != null) {
      final json = jsonDecode(userDetailsJson);
      return UserDetails.fromJson(json);
    }
    return null;
  }

  static Future<void> clearUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_details');
  }
}