import 'package:dio/dio.dart';
import 'package:user_profile_management_app/data/user_model.dart';

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

  Future<List<UserModel>> getUsers() async {
    try {
      Response response = await dio.get('/users');
      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
