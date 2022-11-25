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
                actions: [
                  if (model.tables.isNotEmpty)
                    AppIconButton(
                      onTap: model.onAddDashShow,
                      iconWidget: const Icon(
                        CupertinoIcons.add_circled,
                        color: ColorName.red,
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
                                            onTap: () =>
                                                model.selectTable(item),
                                            text: item.title,
                                            textStyle: item.id ==
                                                    model.currentTable?.id
                                                ? AppTypography
                                                    .sf.black.s26.w500
                                                : AppTypography
                                                    .sf.grey.s24.w400,
                                          ),
                                        ),
                                        AppIconButton(
                                          iconWidget: const Icon(
                                            Icons.edit_note,
                                            size: 29,
                                            color: ColorName.red,
                                          ),
                                          onTap: () =>
                                              model.onAddDashShow(task: item),
                                        ),
                                        if (item.id == model.currentTable?.id &&
                                            model.tasks.isNotEmpty)
                                          AppIconButton(
                                            onTap: model.onAddTaskShow,
                                            iconWidget: const Icon(
                                              CupertinoIcons.add_circled,
                                              color: ColorName.red,
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (_, __) => const SizedBox(
                              width: 10,
                              child: VerticalDivider(
                                color: ColorName.grey,
                              ),
                            ),
                            itemCount: model.tables.length,
                          ),
                        ),
                        const Divider(color: ColorName.darkGrey),
                      ],
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).padding.bottom + 90,
                ),
                child: Center(
                  child: model.currentTable?.tasks == null ||
                          model.currentTable!.tasks!.isEmpty
                      ? Column(
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
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView(
                            children: [
                              ExpansionPanelList(
                                expansionCallback: (panelIndex, isExpanded) =>
                                    model.updateExp(
                                  panelIndex,
                                ),
                                elevation: 0,
                                children: [
                                  for (final item in model.currentTable!.tasks!)
                                    ExpansionPanel(
                                      isExpanded: model.expansions[model
                                          .currentTable!.tasks!
                                          .indexOf(item)],
                                      backgroundColor: Colors.transparent,
                                      headerBuilder: (context, isExpanded) {
                                        return ListTile(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .4,
                                                ),
                                                child: Text(
                                                  item.title,
                                                  overflow: TextOverflow.fade,
                                                  style: AppTypography
                                                      .sf.s24.w600.black
                                                      .copyWith(
                                                    color: model.colorBuilder(
                                                      taskStatusfromInt(
                                                        item.status,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(children: [
                                                if (item.isAuthor)
                                                  AppIconButton(
                                                    onTap: () =>
                                                        model.onAddTaskShow(
                                                            task: item),
                                                    iconWidget: const Icon(
                                                      Icons.edit_note,
                                                      size: 30,
                                                      color: ColorName.red,
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
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5),
                                          minLeadingWidth: 20,
                                          leading: item.links.isNotEmpty
                                              ? SizedBox(
                                                  width: 40,
                                                  child: AppIconButton(
                                                    onTap: () =>
                                                        model.downloadAll(
                                                            item.links),
                                                    iconWidget: Icon(
                                                      Icons.file_download,
                                                      color: ColorName.red
                                                          .withOpacity(0.7),
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox(
                                                  width: 40,
                                                ),
                                          subtitle: Text(
                                            '${item.executor.userName} (${item.executor.email})',
                                            style: AppTypography.sf.s14.black,
                                          ),
                                        );
                                      },
                                      body: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 36),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              LocaleKeys.description.tr(),
                                              style: AppTypography.sf.s18,
                                            ),
                                            const SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Text(
                                                item.description,
                                                style:
                                                    AppTypography.sf.s14.black,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              LocaleKeys.files.tr(),
                                              style: AppTypography.sf.s18,
                                            ),
                                            const SizedBox(height: 5),
                                            for (final link in item.links)
                                              ListTile(
                                                leading: AppIconButton(
                                                  onTap: () =>
                                                      model.downloadOne(link),
                                                  iconWidget: const Icon(
                                                    Icons.file_download,
                                                    color: ColorName.purple,
                                                  ),
                                                ),
                                                title: Text(
                                                  link,
                                                  style: AppTypography.sf.s12,
                                                ),
                                              ),
                                            const SizedBox(height: 20),
                                            if (item.note != null &&
                                                item.note!.isNotEmpty) ...[
                                              Text(
                                                LocaleKeys.note.tr(),
                                                style: AppTypography.sf.s18,
                                              ),
                                              const SizedBox(height: 5),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Text(
                                                  item.note!,
                                                  style: AppTypography.sf.s14,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                            ],
                                            Text(
                                              LocaleKeys.status.tr(),
                                              style: AppTypography.sf.s18,
                                            ),
                                            const SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Row(
                                                children: [
                                                  if (item.status != 0)
                                                    AppIconButton(
                                                      onTap: () => model
                                                          .updateTaskStatus(
                                                        item.status - 1,
                                                        item.id,
                                                      ),
                                                      iconWidget: const Icon(
                                                        Icons.arrow_back_ios,
                                                        color: ColorName.green,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  Text(
                                                    taskStatusfromInt(
                                                      item.status,
                                                    ).title,
                                                    style: AppTypography.sf.s14,
                                                  ),
                                                  if (item.status != 4)
                                                    AppIconButton(
                                                      onTap: () => model
                                                          .updateTaskStatus(
                                                        item.status + 1,
                                                        item.id,
                                                      ),
                                                      iconWidget: const Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: ColorName.green,
                                                        size: 30,
                                                      ),
                                                    )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
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
