import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/serviceController/user_services.dart';

class SharedPrefrenceController {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    // Initialize SharedPreferences instance to access local storage.
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUsers(String object) async {
    // Save the users list as a JSON string in locally with the key "usersJson".
    await prefs.setString("usersJson", object);
  }

  static Future<List<UserModel>> getUsers() async {
    // Call the getUsers function to fetch the initial user list from the API and cache it
    // if there are no users already stored in local storage.
    if (prefs.getString("usersJson") == null) {
      await UserServices().getUsers();
    }

    // Retrieve the cached user list from local storage. If no data is found, return an empty string.
    String dataString = prefs.getString("usersJson") ?? "";

    // Decode the data string into a json object.
    dynamic dataJson = jsonDecode(dataString);

    // Convert the dynamic list into a list of UserModel instances and return it.
    return (dataJson as List).map((e) => UserModel.fromJson(e)).toList();
  }
}
