import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class TabledChartModel with Mappable {
  TabledChartModel({
   this.table,
   this.chart,
  });

  final SmallTableModel? table;
  final ChartModel? chart;
}
