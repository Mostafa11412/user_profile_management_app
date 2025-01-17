import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_management_app/serviceController/sharedPref_controller.dart';

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

   Future editUser(String name , String user , String email) async {
    var data = {
      "name": "$name",
      "username": "$user",
      "email": "$email",
    };
    try {
      Response response = await dio.put(endPoint, data: data);
      print(response.data);
      print(response.statusMessage);
    } catch (e) {
      print(e);
    }
  }

   postUser(String name , String user , String email) async {
    var data = {
      "name": "$name",
      "username": "$user",
      "email": "$email",
    };
    try {
      Response response = await dio.post(endPoint, data: data);
      print(response.data);
      print(response.statusMessage);
    } catch (e) {
      print(e);
    }
  }


}
