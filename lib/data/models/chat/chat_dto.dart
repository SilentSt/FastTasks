import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class ChatDto with Mappable {
  ChatDto({
    this.title,
    required this.userIds,
    required this.private,
  });
  final String? title;
  final List<String> userIds;
  final bool private;
}
