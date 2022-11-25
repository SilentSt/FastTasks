import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class TableModel with Mappable {
  TableModel({
    required this.id,
    required this.title,
    required this.users,
    this.tasks,
  });
  final String id;
  final List<UserModel> users;
  final List<TaskModel>? tasks;
  final String title;
}
