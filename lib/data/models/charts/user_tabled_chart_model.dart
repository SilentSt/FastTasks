import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';


@MappableClass()
class UserTabledChartModel with Mappable {
  UserTabledChartModel({
    this.table,
    required this.tabledChart,
  });

  final ChartUserModel? table;
  final List<TabledChartModel> tabledChart;
}
