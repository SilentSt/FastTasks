import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/charts/charts_user_chart_model.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/screens/charts/charts_vm.dart';
import 'package:tasklet/presentation/screens/charts/widgets/charts_widgets.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';
import 'package:tasklet/presentation/widgets/app_multi_filter_widget.dart';

import 'widgets/test.dart';

class ChartsView extends StatelessWidget {
  const ChartsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChartsViewModel>.reactive(
      viewModelBuilder: () => ChartsViewModel(
        chartService: context.user.chartService,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (BuildContext context, ChartsViewModel model, Widget? child) {
        //return RadarChartSample1();
        if (model.isBusy) {
          return const Scaffold(
            body: Center(child: AppLoading()),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.charts.tr(),
            ),
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              Text(
                LocaleKeys.mainChart.tr(),
                style: AppTypography.sf.s18.w500.black,
              ),
              SizedBox(
                height: 400,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: PieChart(
                        PieChartData(
                          sections: model.data,
                          centerSpaceRadius:
                              MediaQuery.of(context).size.width * .07,
                          sectionsSpace: 1,
                        ),
                      ),
                    ),
                    const Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 10,
                        )),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChartsDetailsText(
                            color: ColorName.grey,
                            text: LocaleKeys.neW.tr(),
                          ),
                          ChartsDetailsText(
                            color: ColorName.green,
                            text: LocaleKeys.doing.tr(),
                          ),
                          ChartsDetailsText(
                            color: ColorName.red,
                            text: LocaleKeys.review.tr(),
                          ),
                          ChartsDetailsText(
                            color: ColorName.blue,
                            text: LocaleKeys.done.tr(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                LocaleKeys.userStatsChart.tr(),
                style: AppTypography.sf.s18.w500.black,
              ),
              const SizedBox(height: 20),
              AppMultiFilterWidget<ChartsUserChartModel>(
                availableValues: model.totalChartModel?.chart ?? [],
                tooltip: 'Выберите пользователя'.tr(),
                callback: model.buildRadar,
                buildName: (item) =>
                    '${item?.user?.userName}\n${item?.user?.email}',
                buildTitle: (selectedItems) => selectedItems
                    .map((e) => e?.user?.userName ?? '')
                    .join(', '),
                selectedItems: model.selectedUserChart,
                title: 'Выберите пользователя'.tr(),
                clear: () => model.buildRadar(null),
              ),
              const SizedBox(height: 20),
              if (model.selectedUserChart.isNotEmpty)
                SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 400,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width < 740
                            ? (MediaQuery.of(context).size.width - 32) * .5
                            : 400,
                        height: 400,
                        child: RadarChart(
                          RadarChartData(
                            tickCount: 1,
                            titleTextStyle: AppTypography.sf.s14.w600.red,
                            radarBackgroundColor: Colors.transparent,
                            dataSets: model.radarData,
                            getTitle: (index, angle) {
                              String title = '';
                              switch (index) {
                                case 0:
                                  title = 'Выдал';
                                  break;
                                case 1:
                                  title = 'Отмененные';
                                  break;
                                case 2:
                                  title = 'Выполнил';
                                  break;
                                case 3:
                                  title = 'Получил';
                                  break;
                              }
                              return RadarChartTitle(
                                text: title,
                                angle: angle == 180 ? 0 : angle,
                              );
                            },
                          ),
                          swapAnimationCurve: Curves.easeIn,
                          swapAnimationDuration:
                              const Duration(milliseconds: 150),
                        ),
                      ),
                      const SizedBox(width: 40),
                      SizedBox(
                        height: 400,
                        width: ((MediaQuery.of(context).size.width - 32) * .4) -
                            15,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            final color = model.colors[index];
                            final item = model.selectedUserChart[index];
                            return Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: ColoredBox(color: color),
                                ),
                                const SizedBox(width: 5),
                                SizedBox(
                                  width:
                                      (MediaQuery.of(context).size.width - 32) *
                                              .4 -
                                          35,
                                  child: Text(
                                    '${item.user?.userName ?? ''}\n${'Всего поинтов'.tr()}:${item.chart?.totalPrice ?? 0}',
                                    style: AppTypography.sf.s14.w400.black,
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 5),
                          itemCount: min(
                            model.selectedUserChart.length,
                            model.colors.length,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              else
                Text(
                  'Выберите хотя бы одного пользователя для отображения данных',
                  style: AppTypography.sf.s18.w500.red,
                ),
              const SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }
}
