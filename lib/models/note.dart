import 'package:hive/hive.dart';
part 'note.g.dart';
@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  String title;
  @HiveField(1)
  String notes;
  @HiveField(2)
  String id;
  @HiveField(3)
  DateTime createdAt;
  @HiveField(4)
  bool favourite;
  @HiveField(5)
  bool archived;

  Note({
    required this.title,
    required this.notes,
    required this.id,
    required this.createdAt,
    required this.favourite,
    required this.archived,
  });
}
