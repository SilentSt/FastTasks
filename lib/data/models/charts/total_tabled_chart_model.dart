import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';


@MappableClass()
class TotalTabledChartModel with Mappable {
  TotalTabledChartModel({
    this.chart,
  });

  final List<UserTabledChartModel>? chart;
}