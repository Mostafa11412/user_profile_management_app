import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceController {
   static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  static Future<void> saveObject(String object) async {
    await sharedPreferences.setString("object", object);
  }

  static String getObject() {
    return sharedPreferences.getString(
          "object",
        ) ??
        "";
  }

}
