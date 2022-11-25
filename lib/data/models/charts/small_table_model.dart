import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class SmallTableModel with Mappable {
  SmallTableModel({
    this.id,
    this.title,
  });

  final String? id;
  final String? title;
}
