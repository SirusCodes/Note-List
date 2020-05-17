import 'package:flutter/material.dart';
import 'package:notes/locator.dart';
import 'package:notes/models/note.dart';
import 'package:notes/services/note_services.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key key, @required this.appBarTitle}) : super(key: key);

  final String appBarTitle;

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  String title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Title",
                    hintText: "Title",
                  ),
                  onChanged: (value) {
                    title = value;
                  },
                ),
              ),
              SizedBox(height: 15),
              Flexible(
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Message",
                    alignLabelWithHint: true,
                    hintText: "Message",
                  ),
                  onChanged: (value) {
                    content = value;
                  },
                ),
              ),
              SizedBox(height: 15),
              Flexible(
                child: RaisedButton(
                  child: Text("Save/Update"),
                  onPressed: () async {
                    Note _note = Note(noteTitle: title, noteContent: content);
                    final success =
                        await locator<NoteServices>().saveNote(_note);
                    if (success) {
                      print("saved");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
