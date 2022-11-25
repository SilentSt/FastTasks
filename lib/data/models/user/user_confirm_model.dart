import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class UserConfirmModel with Mappable {
  UserConfirmModel({
    required this.token,
  });
  final String token;
}
