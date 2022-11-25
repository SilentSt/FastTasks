import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass(ignoreNull: false)
class TableDto with Mappable {
  TableDto({
    this.id,
    required this.title,
    required this.users,
  });
  final String? id;
  final List<UserModel> users;
  final String title;
}
