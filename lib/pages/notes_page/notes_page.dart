import 'package:flutter/material.dart';
import 'package:notesapp/pages/notes_page/notes_page_components/create_note.dart';
import 'package:notesapp/pages/notes_page/notesbox.dart';
class Notesapp extends StatefulWidget {
  @override
  _NotesappState createState() => _NotesappState();
}

class _NotesappState extends State<Notesapp> {
  @override
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  List<String> title = [];
  List<String> notes = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC2C7CA),
        toolbarHeight: 50,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'NotesApp',
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/note12.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            NotesWidget(),
            Spacer(),
            CreateNote(),
          ],
        ),
      ),
    );
  }
}
