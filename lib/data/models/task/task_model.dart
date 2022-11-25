import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class TaskModel with Mappable {
  TaskModel({
    required this.id,
    required this.author,
    required this.executor,
    required this.title,
    required this.description,
    required this.startTime,
    required this.hidden,
    required this.links,
    required this.isAuthor,
    required this.isExecutor,
    required this.duration,
    required this.status,
    this.note,
  });
  final String id;
  final String title;
  final String description;
  final int duration;
  final bool hidden;
  final UserModel author;
  final UserModel executor;
  final int status;
  final bool isAuthor;
  final bool isExecutor;
  final DateTime startTime;
  final List<String> links;
  final String? note;

  //TaskDto copyToDto()=>
}
