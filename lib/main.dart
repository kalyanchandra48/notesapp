import 'package:flutter/material.dart';
import 'package:notesapp/pages/notes_page/notes_page.dart';
import 'package:notesapp/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'dart:async';

Future<void> main()async {
	await HiveInstance.initialiseHive();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Notesapp(),
    ),
  );
}
