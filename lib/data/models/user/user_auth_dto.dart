import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class UserAuthDto with Mappable {
  UserAuthDto({
    this.userName,
    required this.email,
  });
  final String? userName;
  final String email;
}
