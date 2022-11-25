import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class UserConfirmDto with Mappable {
  UserConfirmDto({
    required this.code,
    required this.mailCode,
  });
  final String code;
  final String mailCode;
}
