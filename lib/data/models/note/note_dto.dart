import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class NoteDto with Mappable {
  NoteDto({
    required this.text,
    required this.taskId,
  });
  final String taskId;
  final String text;
}
