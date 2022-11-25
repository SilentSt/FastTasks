import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class TotalProgressChartModel with Mappable {
  final int totalTaskCount;
  final int newTaskCount;
  final int doingTaskCount;
  final int doneTaskCount;
  final int reviewTaskCount;
  final int closedTaskCount;

  TotalProgressChartModel({
    required this.totalTaskCount,
    required this.newTaskCount,
    required this.doingTaskCount,
    required this.doneTaskCount,
    required this.reviewTaskCount,
    required this.closedTaskCount,
  });
}
