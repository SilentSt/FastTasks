import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class StatusDto with Mappable {
  StatusDto({
    required this.id,
    required this.status,
  });

  final String id;
  final int status;
}
