import 'package:dart_mappable/dart_mappable.dart';
import 'package:tasklet/data/models/models.dart';

@MappableClass()
class ChartTimeduserstotalModel with Mappable {
  ChartTimeduserstotalModel({
    required this.user,
    required this.chart,
  });

  final ChartUserModel? user;
  final List<ChartModel> chart;
}
