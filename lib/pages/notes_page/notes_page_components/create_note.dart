import 'package:flutter/material.dart';
import 'package:notesapp/pages/notes_page/notesbox.dart';
import 'package:notesapp/pages/notes_page/bottom_sheet.dart';
import 'package:notesapp/models/models.dart';
import 'package:notesapp/services/services.dart';

class CreateNote extends StatefulWidget {
  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  List<String> title = [];
  List<String> notes = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20, right: 20),
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BottomSheetWidget();
                },
              );
            },
            child: Icon(Icons.add, size: 55, color: Colors.black),
            backgroundColor: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
