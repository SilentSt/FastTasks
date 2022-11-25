import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class MessageDto with Mappable {
  MessageDto({
    required this.text,
    required this.chatId,
    this.tableId,
    this.taskId,
  });
  final String text;
  final String chatId;
  final String? tableId;
  final String? taskId;
}
