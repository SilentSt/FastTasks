import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class ChartUserModel with Mappable {
  ChartUserModel({
    this.id,
    this.userName,
    this.email,
  });

  final String? id;
  final String? userName;
  final String? email;
}
