import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/task/task.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/app/app.dart';
import 'package:tasklet/presentation/screens/dashboards/widgets/task_vm.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_back_button.dart';
import 'package:tasklet/presentation/widgets/app_icon_button.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    Key? key,
    @PathParam('id') required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<
        TaskViewModel>.reactive(
      viewModelBuilder: () => TaskViewModel(
          taskService: context.user.taskService,
          id: id),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            leading: AppBackButton(
              onTap: () => context.router.pop(),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.fromLTRB(
              16,
              0,
              16,
              MediaQuery.of(context)
                      .padding
                      .bottom +
                  100,
            ),
            children: [
              Text(
                model.task?.title ?? '',
                overflow: TextOverflow.fade,
                style: AppTypography
                    .sf.s24.w600.black
                    .copyWith(
                  color: model.colorBuilder(
                    taskStatusfromInt(
                      model.task?.status ?? 0,
                    ),
                  ),
                ),
              ),
              Text(
                'Автор: ${model.task?.author.userName ?? ''}(${model.task?.author.email ?? ''})',
                style: AppTypography
                    .sf.s18.w500.black,
              ),
              Row(children: [
                Text(
                  'Исполнитель: ',
                  style: AppTypography
                      .sf.s18.w500.black,
                ),
                Text(
                    '${model.task?.executor.userName ?? ''}(${model.task?.executor.email ?? ''})',
                    style: AppTypography
                        .sf.s18.w500.black)
              ]),
              const SizedBox(height: 30),
              Text(
                model.task?.description ??
                    'Нет описаия'.tr(),
                style: AppTypography
                    .sf.s15.w400.black,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 200,
                child: GridView(
                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 90),
                  children: (model.task?.links ??
                          [])
                      .map((e) => const SizedBox(
                            width: 90,
                            height: 90,
                            child: ColoredBox(
                                color: ColorName
                                    .purple),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
