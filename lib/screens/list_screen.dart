import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/services/note_services.dart';
import 'package:date_format/date_format.dart';
import '../locator.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final _service = locator<NoteServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notes"),
      ),
      body: FutureBuilder(
        future: _service.getNoteList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Note> _noteList = snapshot.data;
            return ListView.builder(
              itemCount: _noteList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_noteList[index].noteTitle),
                  subtitle: Text(_getDate(_noteList, index)),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  String _getDate(List<Note> _noteList, int index) =>
      formatDate(_noteList[index].latestEditDateTime, [dd, "/", mm, "/", yyyy]);
}
