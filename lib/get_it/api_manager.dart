import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<String> checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiKey = prefs.getString("API_KEY");

    if (apiKey == null) {
      http.Response res =
          await http.get("http://api.notes.programmingaddict.com/apiKey");
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        apiKey = data["apiKey"];

        prefs.setString("API_KEY", apiKey);
      } else {
        print("Error occured");
      }
    }
    return apiKey;
  }
}
