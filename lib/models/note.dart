import 'package:flutter/foundation.dart';

class Note {
  String noteID;
  String noteTitle, noteContent;
  DateTime createDateTime, latestEditDateTime;

  Note({
    this.noteID,
    @required this.noteTitle,
    this.noteContent,
    this.createDateTime,
    this.latestEditDateTime,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      noteID: json["noteID"],
      noteTitle: json["noteTitle"],
      createDateTime: DateTime.parse(json["createDateTime"]),
      latestEditDateTime:
          DateTime.parse(json["latestEditDateTime"] ?? json["createDateTime"]),
    );
  }

  factory Note.fromJsonWithContent(Map<String, dynamic> json) {
    return Note(
      noteID: json["noteID"],
      noteTitle: json["noteTitle"],
      noteContent: json["noteContent"],
      createDateTime: DateTime.parse(json["createDateTime"]),
      latestEditDateTime:
          DateTime.parse(json["latestEditDateTime"] ?? json["createDateTime"]),
    );
  }

  Map toJson() {
    return {
      "noteTitle": noteTitle,
      "noteContent": noteContent,
    };
  }
}
