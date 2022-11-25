import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';


@MappableClass()
class UserTabledChartModel with Mappable {
  UserTabledChartModel({
    this.user,
    required this.tabledChart,
  });

  final ChartUserModel? user;
  final List<TabledChartModel> tabledChart;
}
