import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/task/task_duration.dart';
import 'package:tasklet/domain/di/global_dependency.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/assets.gen.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/app/app.dart';
import 'package:tasklet/presentation/navigation/app_router.dart';
import 'package:tasklet/presentation/screens/dashboards/dashboards_vm.dart';
import 'package:tasklet/presentation/screens/dashboards/dialogs/task/add_edit_task.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_button.dart';
import 'package:tasklet/presentation/widgets/app_icon_button.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';
import 'package:tasklet/presentation/widgets/app_text_button.dart';

import 'dialogs/dash/add_edit_dashboard.dart';

class DashboardsView extends StatelessWidget {
  const DashboardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardsViewModel>.reactive(
      viewModelBuilder: () => DashboardsViewModel(
        tableService: context.user.tableService,
        taskService: context.user.taskService,
        authService: context.global.authService,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.dashboard.tr()),
              automaticallyImplyLeading: false,
            ),
            body: const Center(
              child: AppLoading(),
            ),
          );
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text(
                  LocaleKeys.dashboard.tr(),
                ),
                automaticallyImplyLeading: false,
                actions: [
                  if (model.tables.isNotEmpty)
                    AppIconButton(
                      onTap: model.onAddDashShow,
                      iconWidget: const Icon(
                        CupertinoIcons.add_circled,
                        color: ColorName.purple,
                      ),
                    ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(55),
                  child: SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              final item = model.tables[index];
                              final width = (item.title.length * 40).toDouble();
                              return SizedBox(
                                width: width > 80 ? width : 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: AppTextButton(
                                            onTap: () => model.selectTable(item),
                                            text: item.title,
                                            textStyle: item.id == model.currentTable?.id
                                                ? AppTypography.sf.lightGrey.s26.w500
                                                : AppTypography.sf.grey.s24.w400,
                                          ),
                                        ),
                                        AppIconButton(
                                          iconWidget: const Icon(
                                            Icons.edit_note,
                                            size: 29,
                                            color: ColorName.purple,
                                          ),
                                          onTap: () => model.onAddDashShow(task: item),
                                        ),
                                        if (item.id == model.currentTable?.id && model.tasks.isNotEmpty)
                                          AppIconButton(
                                            onTap: model.onAddTaskShow,
                                            iconWidget: const Icon(
                                              CupertinoIcons.add_circled,
                                              color: ColorName.purple,
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (_, index) {
                              if (index == model.tables.length && model.isLoadingMore) {
                                return const AppLoading();
                              }
                              return const SizedBox(
                                width: 10,
                                child: VerticalDivider(
                                  color: ColorName.grey,
                                ),
                              );
                            },
                            itemCount: model.tables.length,
                          ),
                        ),
                        const Divider(color: ColorName.darkGrey),
                      ],
                    ),
                  ),
                ),
              ),
              body: model.dashboardChanging
                  ? const Center(
                      child: AppLoading(),
                    )
                  : Center(
                      child: model.currentTable?.tasks == null || model.currentTable!.tasks!.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LottieBuilder.asset(
                                    Assets.animations.empty,
                                    height: 200,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    model.tables.isEmpty
                                        ? LocaleKeys.emptyDashboardList.tr()
                                        : LocaleKeys.emptyDashboard.tr(),
                                    textAlign: TextAlign.center,
                                    style: AppTypography.sf.grey.s18.w400,
                                  ),
                                  const SizedBox(height: 20),
                                  if (model.tables.isEmpty)
                                    AppButton(
                                      onTap: model.onAddDashShow,
                                      buttonColor: ColorName.purple,
                                      text: LocaleKeys.addDashboard.tr(),
                                    )
                                  else if (model.tasks.isEmpty)
                                    AppButton(
                                      onTap: model.onAddTaskShow,
                                      buttonColor: ColorName.purple,
                                      text: LocaleKeys.addTask.tr(),
                                    ),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: ListView(
                                padding: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  bottom: MediaQuery.of(context).padding.bottom + 90,
                                ),
                                children: [
                                  for (final item in model.currentTable!.tasks!)
                                    ListTile(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      onTap: () => App.router.push(TaskViewRoute(id: item.id)),
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context).size.width * .4,
                                            ),
                                            child: Text(
                                              item.title,
                                              overflow: TextOverflow.fade,
                                              style: AppTypography.sf.s24.w600.lightGrey.copyWith(
                                                color: model.colorBuilder(
                                                  taskStatusfromStr(
                                                    item.status,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(children: [
                                            if (item.isAuthor)
                                              AppIconButton(
                                                onTap: () => model.onAddTaskShow(task: item),
                                                iconWidget: const Icon(
                                                  Icons.edit_note,
                                                  size: 30,
                                                  color: ColorName.purple,
                                                ),
                                              ),
                                            if (item.isExecutor)
                                              AppIconButton(
                                                onTap: () => model.addNote(
                                                  context,
                                                  item,
                                                ),
                                                iconWidget: const Padding(
                                                  padding: EdgeInsets.only(top: 3),
                                                  child: Icon(
                                                    size: 20,
                                                    CupertinoIcons.pin,
                                                    color: ColorName.green,
                                                  ),
                                                ),
                                              ),
                                          ]),
                                        ],
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                                      minLeadingWidth: 20,
                                      leading: item.links.isNotEmpty
                                          ? SizedBox(
                                              width: 40,
                                              child: AppIconButton(
                                                onTap: () => model.downloadAll(item.links),
                                                iconWidget: Icon(
                                                  Icons.file_download,
                                                  color: ColorName.purple.withOpacity(0.7),
                                                ),
                                              ),
                                            )
                                          : const SizedBox(
                                              width: 40,
                                            ),
                                      subtitle: Text(
                                        '${item.executor.userName} (${item.executor.email})',
                                        style: AppTypography.sf.s14.lightGrey,
                                      ),
                                    ),
                                  if (model.isLoadingMore)
                                    const AppLoading()
                                  else
                                    AppTextButton(
                                      onTap: model.fetchTasksFromCurrentTable,
                                      text: 'Загрузить больше задач',
                                      textStyle: AppTypography.sf.s20.purple,
                                    ),
                                ],
                              ),
                            ),
                    ),
            ),
            const AddEditDashDialog(),
            const AddEditTaskDialog(),
          ],
        );
      },
    );
  }
}
