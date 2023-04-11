import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class TaskDto with Mappable {
  TaskDto({
    required this.executorId,
    required this.title,
    required this.hidden,
    required this.links,
    required this.description,
    required this.tableId,
    required this.duration,
    this.dateTime,
    this.note,
    this.id,
    this.status,
    this.price,
  });
  final String? id;
  final String title;
  final String description;
  final DateTime? dateTime;
  final int duration;
  final bool hidden;
  final String tableId;
  final String executorId;
  final List<String> links;
  final String? note;
  final int? status;
  final int? price;
}
