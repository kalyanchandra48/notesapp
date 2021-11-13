import 'package:notesapp/models/note.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:async';

class HiveInstance {
  static late Box _notesBox;

  static initialiseHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteAdapter());

    _notesBox = await Hive.openBox('notes_box');
  }

  static Box get notesBox {
    return _notesBox;
  }
}
