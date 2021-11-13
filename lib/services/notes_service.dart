import 'package:notesapp/services/services.dart';
import 'package:notesapp/models/models.dart';

class NotesService {
  static saveNoteLocally(Note note) {
    Global.boxes[BOX_NAME.NOTES_BOX]!.put(note.id, note);
  }

  static deleteNoteLocally(String id){
  
  Global.boxes[BOX_NAME.NOTES_BOX]!.delete(id);
  
  }

  static updateNoteLocally(Note note){
  }
}
