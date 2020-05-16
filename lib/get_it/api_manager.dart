import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static String apiKey;

  void checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiKey = prefs.getString("API_KEY");

    if (apiKey == null) {
      http.get("http://api.notes.programmingaddict.com/apiKey").then((value) {
        if (value.statusCode == 200) {
          final data = json.decode(value.body);
          apiKey = data["apiKey"];

          prefs.setString("API_KEY", apiKey);
        } else {
          print("Error occured");
        }
      }).catchError((onError) {
        print(onError);
      });
    }
    print(apiKey);
  }
}
