import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class ChartModel with Mappable {
  ChartModel({
    required this.totalTaskCount,
    required this.completedTaskCount,
    required this.closedTaskCount,
    required this.authoredTaskCount,
    required this.totalPrice,
    this.date,
  });

  final int totalTaskCount;
  final int completedTaskCount;
  final int closedTaskCount;
  final int authoredTaskCount;
  final int totalPrice;
  final DateTime? date;
}
