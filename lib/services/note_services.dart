import 'dart:convert';

import 'package:notes/get_it/api_manager.dart';
import 'package:http/http.dart' as http;
import 'package:notes/models/note.dart';
import '../locator.dart';

class NoteServices {
  String apiKey;
  final baseUrl = "http://api.notes.programmingaddict.com";
  Future init() async {
    apiKey = await locator<ApiManager>().checkIfLoggedIn();
  }

  Future<List<Note>> getNoteList() async {
    await init();
    final http.Response response =
        await http.get(baseUrl + "/notes", headers: {"apiKey": apiKey});
    print(apiKey);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => Note.fromJson(e)).toList();
    }
    throw Exception("Something went Wrong");
  }
}
