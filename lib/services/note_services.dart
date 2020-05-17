import 'dart:convert';

import 'package:notes/get_it/api_manager.dart';
import 'package:http/http.dart' as http;
import 'package:notes/models/note.dart';
import '../locator.dart';

class NoteServices {
  String apiKey;
  final baseUrl = "http://api.notes.programmingaddict.com/notes";
  Future init() async {
    apiKey = await locator<ApiManager>().checkIfLoggedIn();
  }

  Future<List<Note>> getNoteList() async {
    await init();
    final http.Response response =
        await http.get(baseUrl, headers: {"apiKey": apiKey});
    print(apiKey);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => Note.fromJson(e)).toList();
    }
    throw Exception("Something went Wrong");
  }

  Future<bool> saveNote(Note note) async {
    final http.Response response = await http.post(baseUrl,
        headers: {"apiKey": apiKey, 'Content-Type': 'application/json'},
        body: json.encode(note.toJson()));

    if (response.statusCode == 201) return true;
    return false;
  }

  Future<bool> deleteNote(String noteID) async {
    final http.Response response = await http.delete(baseUrl + "/$noteID",
        headers: {"apiKey": apiKey, 'Content-Type': 'application/json'});

    if (response.statusCode == 204) return true;
    return false;
  }
}
