import 'package:flutter/foundation.dart';

class Note {
  String noteID;
  String noteTitle, noteContent;
  DateTime createDateTime, latestEditDateTime;

  Note({
    this.noteID,
    @required this.noteTitle,
    this.noteContent,
    @required this.createDateTime,
    @required this.latestEditDateTime,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      noteID: json["noteID"],
      noteTitle: json["noteTitle"],
      noteContent: json["noteContent"],
      createDateTime: json["createDateTime"],
      latestEditDateTime: json["latestEditDateTime"] ?? json["createDateTime"],
    );
  }

  toJson(Note note) {
    return {
      "noteTitle": noteTitle,
      "noteContent": noteContent,
    };
  }
}
