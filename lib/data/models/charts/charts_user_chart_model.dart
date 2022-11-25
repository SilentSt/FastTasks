import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class ChartsUserChartModel with Mappable {
  ChartsUserChartModel({
    this.user,
    this.chart,
  });

  final ChartUserModel? user;
  final ChartModel? chart;
}
