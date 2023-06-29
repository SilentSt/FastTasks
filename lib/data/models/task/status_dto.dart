import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class StatusModel with Mappable {
  StatusModel({
    required this.id,
    required this.status,
  });

  final String id;
  final String status;
}
