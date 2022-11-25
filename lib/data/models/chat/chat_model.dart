import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class ChatModel with Mappable {
  ChatModel({
    required this.id,
    this.title,
    required this.private,
    this.lastMessage,
  });
  final String id;
  final String? title;
  final bool private;
  final String? lastMessage;
}
