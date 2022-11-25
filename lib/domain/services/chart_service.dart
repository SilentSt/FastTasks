import 'package:flutter/src/widgets/framework.dart';
import 'package:tasklet/data/data_sources/chart/remote_chart_ds.dart';
import 'package:tasklet/data/data_sources/core/app_local_ds.dart';
import 'package:tasklet/data/models/charts/charts.dart';
import 'package:tasklet/domain/services/core/app_service.dart';
import 'package:tasklet/domain/services/core/error_checker_mixin.dart';

class ChartService
    extends AppService<BaseLocalDataSource, RemoteChartDataSource>
    with ErrorChecker {
  ChartService(super.lds, super.rds, super.errorService);

  @override
  Future<void> init(BuildContext context) async {}

  Future<TotalChartModel?> userstotal() async {
    final res = await rds.userstotal();
    final checked = errorChecker(res, nullableBody: false);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body;
  }

  Future<TotalProgressChartModel?> total() async {
    final res = await rds.total();
    final checked = errorChecker(res, nullableBody: false);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body;
  }

  Future<TotalTabledChartModel?> userstabledtotal() async {
    final res = await rds.userstabledtotal();
    final checked = errorChecker(res, nullableBody: false);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body;
  }

  @override
  void dispose() {}
}
