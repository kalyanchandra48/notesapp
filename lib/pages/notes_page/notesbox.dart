import 'package:flutter/material.dart';
import 'dart:math';
import 'package:notesapp/models/models.dart';
import 'package:notesapp/services/services.dart';
import 'package:notesapp/pages/notes_page/bottom_sheet.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotesWidget extends StatefulWidget {
  @override
  _NotesWidgetState createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 186,
      child: ValueListenableBuilder(
          valueListenable: Global.boxes[BOX_NAME.NOTES_BOX]!.listenable(),
          builder: (context, Box box, wid) {
            final List<Note> notes = List<Note>.from(box.values);
            return ListView.builder(
              shrinkWrap: true,
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return NoteWidget(note: notes[index], index: index);
              },
            );
          }),
      //listview ends here
    );
  }
}

class NoteWidget extends StatelessWidget {
  final Note note;
  final int index;
  NoteWidget({
    required this.note,
    required this.index,
  });
  Color color = Colors.white;
  updateNotes(BuildContext context) async {
    Global.boxes[BOX_NAME.NOTES_BOX]!.putAt(index, note);
    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetWidget(note: this.note),
    );
  }

  updateFav() async {
    this.note.favourite = !this.note.favourite;
    Global.boxes[BOX_NAME.NOTES_BOX]!.putAt(index, this.note);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 19, right: 19),
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(26)),
            color: Colors
                .primaries[Random().nextInt(Colors.primaries.length)].shade200,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 10, right: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    this.note.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 10, top: 8),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    this.note.notes,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 7.9,
          left: MediaQuery.of(context).size.width / 1.19,
          child: GestureDetector(
            onTap: () {
              NotesService.deleteNoteLocally(note.id);
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xCCffffff),
              child: Icon(Icons.delete_outlined),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 7.9,
          left: MediaQuery.of(context).size.width / 1.37,
          child: GestureDetector(
            onTap: () {
              updateNotes(context);
            },
            child: CircleAvatar(
              radius: 20,
              child: Icon(Icons.edit_outlined),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 39,
          left: MediaQuery.of(context).size.width / 1.15,
          child: GestureDetector(
            onTap: () {
              updateFav();
            },
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.favorite,
                color: note.favourite == true ? Colors.blue : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
