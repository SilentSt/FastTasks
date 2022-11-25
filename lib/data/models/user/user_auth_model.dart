import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class UserAuthModel with Mappable {
  UserAuthModel({
    required this.code,
  });
  final String code;
}
