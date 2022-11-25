import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class UserModel with Mappable {
  UserModel({
    required this.id,
    this.userName,
    required this.email,
    this.avatar,
  });
  final String id;
  final String? userName;
  final String email;
  final String? avatar;
}
