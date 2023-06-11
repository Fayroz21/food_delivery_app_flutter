import 'dart:convert';
 import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// It's local for the device
class CacheHelper {
  static SharedPreferences? sharedPreferences;

//initializing shared preferences instance
  static onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();

  }

//get dynamic data from the shared preferences
  static dynamic getDataToSharedPrefrence(String key) {
    return sharedPreferences!.get(key);
  }

//add dynamic data to the shared preferences
  static Future<bool> saveDataToSharedPrefrence(
      String key, dynamic value) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    if (value is double) return await sharedPreferences!.setDouble(key, value);
    if (value == null) return await sharedPreferences!.setString(key, value.toString());

    value = jsonEncode(value);
    return await sharedPreferences!.setString(key, value);
  }

  static removeData(String key){
    sharedPreferences?.remove(key);
  }
}
