import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/charts/charts_user_chart_model.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class TotalChartModel with Mappable {
  TotalChartModel({
    required this.chart,
  });

  final List<ChartsUserChartModel> chart;
}
