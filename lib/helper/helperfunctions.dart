import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceNameKey = "NAMEKEY";
  static String sharedPreferenceEmailKey = "EMAILKEY";

  //SAVING DATA TO SHARED PREFERENCE

  static Future<void> saveLoggedInSharedPreference(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPreferenceLoggedInKey, isUserLoggedIn);
  }

  static Future<void> saveNameSharedPreference(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceNameKey, name);
  }

  static Future<void> saveEmailSharedPreference(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceEmailKey, email);
  }

  //GETTING DATA FROM SHARED PREFERENCE

  static Future<bool> getLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPreferenceLoggedInKey);
  }

  static Future<String> getNameSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferenceNameKey);
  }

  static Future<String> getEmailSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferenceEmailKey);
  }
}
