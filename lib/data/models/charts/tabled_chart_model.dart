import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/charts/charts_user_chart_model.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class TabledChartModel with Mappable {
  TabledChartModel({
   this.table,
   required this.chart,
  });

  final SmallTableModel? table;
  final List<ChartsUserChartModel> chart;
}
