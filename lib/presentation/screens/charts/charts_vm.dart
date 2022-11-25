import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/charts/chart_timeduserstotal_model.dart';
import 'package:tasklet/data/models/charts/charts_user_chart_model.dart';
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
  List<ChartTimeduserstotalModel> lineChartModel = [];

  List<ChartsUserChartModel> selectedUserChart = [];

  List<TabledChartModel> selectedTableChart = [];

  List<PieChartSectionData> data = [
    PieChartSectionData(title: LocaleKeys.neW.tr(), color: ColorName.grey),
    PieChartSectionData(title: LocaleKeys.doing.tr(), color: ColorName.green),
    PieChartSectionData(title: LocaleKeys.review.tr(), color: ColorName.red),
    PieChartSectionData(title: LocaleKeys.done.tr(), color: ColorName.blue),
  ];

  ChartTimeduserstotalModel? selectedChartModel;

  List<RadarDataSet> radarData = [];
  List<RadarDataSet> radarTabledData = [];
  List<LineChartBarData> lineData = [];
  List<Color> colors = [];
  List<Color> colorsTabled = [];
  bool totalTaskCountEnabled = true;
  bool completedTaskCounEnabled = true;
  bool closedTaskCountEnabled = true;
  bool authoredTaskCountEnabled = true;

  Future<void> onReady() async {
    setBusy(true);
    totalChartModel = await chartService.userstotal();
    totalProgressChartModel = await chartService.total();
    totalTabledChartModel = await chartService.userstabledtotal();
    lineChartModel = await chartService.timeduserstotal();
    if (lineChartModel.isNotEmpty) {
      fillLine(lineChartModel.first);
    }
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

  void buildTabledRadar(TabledChartModel? value) {
    if (value == null) {
      selectedTableChart.clear();
    } else if (selectedTableChart.contains(value)) {
      selectedTableChart.remove(value);
    } else {
      selectedTableChart.add(value);
    }
    colorsTabled.clear();
    radarTabledData = selectedTableChart
        .expand((element) => element.chart.map(
              (user) {
                final color = Color.fromRGBO(
                  Random().nextInt(255) + 50,
                  Random().nextInt(255) + 50,
                  Random().nextInt(255) + 50,
                  1,
                );
                colorsTabled.add(color);
                return RadarDataSet(
                  fillColor: color.withOpacity(.1),
                  borderColor: color,
                  borderWidth: 2,
                  dataEntries: [
                    RadarEntry(
                      value: (user.chart?.authoredTaskCount ?? 0).toDouble(),
                    ),
                    RadarEntry(
                      value: (user.chart?.closedTaskCount ?? 0).toDouble(),
                    ),
                    RadarEntry(
                      value: (user.chart?.completedTaskCount ?? 0).toDouble(),
                    ),
                    // RadarEntry(
                    //   value: (user.chart?.totalPrice ?? 0).toDouble(),
                    // ),
                    RadarEntry(
                      value: (user.chart?.totalTaskCount ?? 0).toDouble(),
                    ),
                  ],
                );
              },
            ))
        .toList();
    notifyListeners();
  }

  void buildRadar(ChartsUserChartModel? value) {
    if (value == null) {
      selectedUserChart.clear();
    } else if (selectedUserChart.contains(value)) {
      selectedUserChart.remove(value);
    } else {
      selectedUserChart.add(value);
    }
    colors.clear();
    radarData = selectedUserChart.map(
      (user) {
        final color = Color.fromRGBO(
          Random().nextInt(255) + 50,
          Random().nextInt(255) + 50,
          Random().nextInt(255) + 50,
          1,
        );
        colors.add(color);
        return RadarDataSet(
          fillColor: color.withOpacity(.1),
          borderColor: color,
          borderWidth: 2,
          dataEntries: [
            RadarEntry(
              value: (user.chart?.authoredTaskCount ?? 0).toDouble(),
            ),
            RadarEntry(
              value: (user.chart?.closedTaskCount ?? 0).toDouble(),
            ),
            RadarEntry(
              value: (user.chart?.completedTaskCount ?? 0).toDouble(),
            ),
            // RadarEntry(
            //   value: (user.chart?.totalPrice ?? 0).toDouble(),
            // ),
            RadarEntry(
              value: (user.chart?.totalTaskCount ?? 0).toDouble(),
            ),
          ],
        );
      },
    ).toList();
    notifyListeners();
  }

  void fillLine(ChartTimeduserstotalModel? value) {
    if (value != null) {
      selectedChartModel = value;
    }
    if (selectedChartModel == null) return;

    final totalTaskCount = selectedChartModel!.chart.map((e) => e.totalTaskCount).toList();
    final completedTaskCoun = selectedChartModel!.chart.map((e) => e.completedTaskCount).toList();
    final closedTaskCount = selectedChartModel!.chart.map((e) => e.closedTaskCount).toList();
    final authoredTaskCount = selectedChartModel!.chart.map((e) => e.authoredTaskCount).toList();
    //final totalPrice = selectedChartModel!.chart.map((e) => e.totalPrice).toList();
    lineData = [
      if (totalTaskCountEnabled)
        LineChartBarData(
          color: ColorName.blue,
          spots: [
            for (int i = 0; i < totalTaskCount.length; i++)
              FlSpot(
                i.toDouble(),
                totalTaskCount[i].toDouble(),
              ),
          ],
        ),
      if (completedTaskCounEnabled)
        LineChartBarData(
          color: ColorName.green,
          spots: [
            for (int i = 0; i < completedTaskCoun.length; i++)
              FlSpot(
                i.toDouble(),
                completedTaskCoun[i].toDouble(),
              ),
          ],
        ),
      if (closedTaskCountEnabled)
        LineChartBarData(
          color: ColorName.red,
          spots: [
            for (int i = 0; i < closedTaskCount.length; i++)
              FlSpot(
                i.toDouble(),
                closedTaskCount[i].toDouble(),
              ),
          ],
        ),
      if (authoredTaskCountEnabled)
        LineChartBarData(
          color: ColorName.darkGrey,
          isStepLineChart: false,
          curveSmoothness: 20,
          spots: [
            for (int i = 0; i < authoredTaskCount.length; i++)
              FlSpot(
                i.toDouble(),
                authoredTaskCount[i].toDouble(),
              ),
          ],
        ),
      // LineChartBarData(
      //   color: ColorName.purple,
      //   spots: [
      //     for (int i = 0; i < totalPrice.length; i++)
      //       FlSpot(
      //         i.toDouble(),
      //         totalPrice[i].toDouble(),
      //       ),
      //   ],
      // ),
    ];
    notifyListeners();
  }

  void enableDisabeTotal() {
    totalTaskCountEnabled = !totalTaskCountEnabled;
    fillLine(null);
    notifyListeners();
  }

  void enableDisabeCompleted() {
    completedTaskCounEnabled = !completedTaskCounEnabled;
    fillLine(null);
    notifyListeners();
  }

  void enableDisabeClosed() {
    closedTaskCountEnabled = !closedTaskCountEnabled;
    fillLine(null);
    notifyListeners();
  }

  void enableDisabeAuthored() {
    authoredTaskCountEnabled = !authoredTaskCountEnabled;
    fillLine(null);
    notifyListeners();
  }
}
