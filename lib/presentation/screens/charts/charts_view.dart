
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/screens/charts/charts_vm.dart';
import 'package:tasklet/presentation/screens/charts/widgets/charts_widgets.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';

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
        if (model.isBusy) {
          return const Scaffold(
            body: Center(child: AppLoading()),
          );
        }
        return Scaffold(
          body: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: PieChart(
                    PieChartData(
                      sections: model.data,
                      centerSpaceRadius: 50,
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 1,
                    ),
                  ),
                ),
                Column(
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
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
