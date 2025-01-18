import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/serviceController/shared_pref_controller.dart';

class UserServices {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  late Dio dio;

  UserServices() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
  }
  Future<void> getUsers() async {
    try {
      // Fetch users from the API using dio.get() and store the response.
      Response response = await dio.get('/users');

      // Convert the API response data to JSON format.
      String data = jsonEncode(response.data);

      // Save the fetched users locally to shared preferences.
      SharedPrefrenceController.saveUsers(data);
    } catch (e) {
      // Handle exceptions by throwing a descriptive error.
      throw Exception(e.toString());
    }
  }

  Future<void> deleteUser({required int userId}) async {
    String result = '';

    try {
      // Send a delete request to the API for the specified userId.
      var response = await dio.delete('/users/$userId');

      // Retrieve the status message from the API response.
      result = response.statusMessage ?? "NA";
      debugPrint(result);

      // Get the list of users from shared preferences.
      var users = await SharedPrefrenceController.getUsers();

      // Remove the user with the matching userId from the list.
      users.removeWhere(
        (element) => element.id == userId,
      );

      // Save the updated user list back to shared preferences.
      SharedPrefrenceController.saveUsers(jsonEncode(users));
    } catch (e) {
      // Log the exception details for debugging.
      debugPrint("=================================================");
      debugPrint(e.toString());
      debugPrint("=================================================");
    }
  }

  Future editUser(UserModel user) async {
    try {
      // Send a put request to the API for the specified userId.
      Response response =
          await dio.put('/users/${user.id}', data: user.toJson());
      if (response.statusCode == 200) {
        // Get the list of users from shared preferences.
        var users = await SharedPrefrenceController.getUsers();
        // Get the current user by id and update it.
        users[users.indexWhere((u) => u.id == user.id)] = user;
        // Convert the users list to JSON format.
        String data = jsonEncode(users);
        // Save the updated list of users.
        SharedPrefrenceController.saveUsers(data);
      }
    } catch (e) {
      // Handle exceptions by throwing a descriptive error.
      throw Exception(e.toString());
    }
  }

  addUser(UserModel user) async {
    try {
      // Send a post request to the API to add new user.
      Response response = await dio.post('/users', data: user.toJson());

      // Print the data and the response status
      debugPrint("${response.data}");
      debugPrint("${response.statusMessage}");

      // Get the list of users from shared preferences.
      var users = await SharedPrefrenceController.getUsers();

      // Check if it is null id
      if (response.data != null && response.data['id'] != null) {
        user.id = users.length + 1;
      }

      // Add the user to the list.
      users.add(user);

      // Save the updated list of users.
      SharedPrefrenceController.saveUsers(jsonEncode(users));
    } catch (e) {
      // Handle exceptions by throwing a descriptive error.
      debugPrint(e.toString());
    }
  }
}
