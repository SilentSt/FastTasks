import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class MessageModel with Mappable {
  MessageModel({
    required this.id,
    required this.text,
    required this.time,
    required this.from,
    required this.chatId,
    this.tableId,
    this.taskId,
    this.self,
  });
  final String id;
  final String text;
  final DateTime time;
  final UserModel? from;
  final String? chatId;
  final String? tableId;
  final String? taskId;
  final bool? self;
}
