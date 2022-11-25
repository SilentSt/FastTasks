import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/models.dart';

import 'package:tasklet/domain/services/chart_service.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';

class ChartsViewModel extends BaseViewModel {
  ChartsViewModel({
    required this.chartService,
  });

  final ChartService chartService;
  TotalChartModel? totalChartModel;
  TotalProgressChartModel? totalProgressChartModel;
  TotalTabledChartModel? totalTabledChartModel;

  List<PieChartSectionData> data = [
    PieChartSectionData(title: LocaleKeys.neW.tr(), color: ColorName.grey),
    PieChartSectionData(title: LocaleKeys.doing.tr(), color: ColorName.green),
    PieChartSectionData(title: LocaleKeys.review.tr(), color: ColorName.red),
    PieChartSectionData(title: LocaleKeys.done.tr(), color: ColorName.blue),
  ];

  Future<void> onReady() async {
    setBusy(true);
    totalChartModel = await chartService.userstotal();
    totalProgressChartModel = await chartService.total();
    totalTabledChartModel = await chartService.userstabledtotal();
    fillData();
    setBusy(false);
  }

  void fillData() {
    data = [
      PieChartSectionData(
        title: (totalProgressChartModel?.newTaskCount ?? 0).toString(),
        color: ColorName.grey,
        value: (totalProgressChartModel?.newTaskCount ?? 0).toDouble(),
      ),
      PieChartSectionData(
        title: (totalProgressChartModel?.doingTaskCount ?? 0).toString(),
        color: ColorName.green,
        value: (totalProgressChartModel?.doingTaskCount ?? 0).toDouble(),
      ),
      PieChartSectionData(
        title: (totalProgressChartModel?.reviewTaskCount ?? 0).toString(),
        color: ColorName.red,
        value: (totalProgressChartModel?.reviewTaskCount ?? 0).toDouble(),
      ),
      PieChartSectionData(
        title: (totalProgressChartModel?.doneTaskCount ?? 0).toString(),
        color: ColorName.blue,
        value: (totalProgressChartModel?.doneTaskCount ?? 0).toDouble(),
      ),
    ];
  }
}
