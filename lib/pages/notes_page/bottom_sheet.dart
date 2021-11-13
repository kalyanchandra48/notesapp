import 'package:flutter/material.dart';
import 'package:notesapp/models/models.dart';
import 'package:notesapp/services/services.dart';
import 'package:notesapp/services/notes_service.dart';

class BottomSheetWidget extends StatefulWidget {
  Note? note;
  BottomSheetWidget({this.note});
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  late TextEditingController titleController, noteController;

  @override
  initState() {
    super.initState();
    String _title = widget.note == null ? '' : widget.note!.title;
    String _note = widget.note == null ? '' : widget.note!.notes;
    titleController = new TextEditingController(text: _title);
    noteController = new TextEditingController(text: _note);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.02,
      ),
      height: height / 2,
      child: ListView(
        children: [
          TextField(
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: titleController,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a Title...'),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: height / 38,
          ),
          TextField(
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: noteController,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a Notes...'),
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: height / 4,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              elevation: 10,
              backgroundColor: Colors.yellow,
              onPressed: () {
                if (titleController.text == '') {
                  Navigator.pop(context);
                  return;
                }
                if (widget.note == null) {
                  final Note n = new Note(
                      title: titleController.text,
                      notes: noteController.text,
                      id: Utils.getSecureString(20),
                      createdAt: DateTime.now(),
                      favourite: false,
                      archived: false);
                  NotesService.saveNoteLocally(n);
                } else {
                  final Note n = new Note(
                    title: titleController.text,
                    notes: noteController.text,
                    id: widget.note!.id,
                    createdAt: widget.note!.createdAt,
                    favourite: widget.note!.favourite,
                    archived: widget.note!.archived,
                  );
                  NotesService.saveNoteLocally(n);
                }
                Navigator.pop(context);
              },
              child: Icon(Icons.save_outlined, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
