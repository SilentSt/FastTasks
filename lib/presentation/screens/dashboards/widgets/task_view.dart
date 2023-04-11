import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' hide StackedRouterExtensions;
import 'package:tasklet/data/models/task/task.dart';
import 'package:tasklet/domain/di/global_dependency.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/assets.gen.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/navigation/app_router.dart';
import 'package:tasklet/presentation/screens/dashboards/widgets/task_vm.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_back_button.dart';
import 'package:tasklet/presentation/widgets/app_button.dart';
import 'package:tasklet/presentation/widgets/app_icon_button.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';
import 'package:tasklet/presentation/widgets/app_single_filter_widget.dart';
import 'package:tasklet/presentation/widgets/app_text_button.dart';
import 'package:tasklet/presentation/widgets/app_text_field.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    Key? key,
    @PathParam('id') required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskViewModel>.reactive(
      viewModelBuilder: () => TaskViewModel(
        taskService: context.user.taskService,
        errorService: context.global.errorService,
        id: id,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: AppBackButton(
                onTap: () => context.router.replace(const DashboardsViewRoute()),
              ),
            ),
            body: const Center(
              child: AppLoading(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(LocaleKeys.tasks.tr()),
            leading: AppBackButton(
              onTap: () => context.router.replace(const DashboardsViewRoute()),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.fromLTRB(
              16,
              0,
              16,
              MediaQuery.of(context).padding.bottom + 100,
            ),
            children: [
              Text(
                model.task?.title ?? '',
                overflow: TextOverflow.fade,
                style: AppTypography.sf.s24.w600.black,
              ),
              const SizedBox(height: 15),
              Text(
                '${LocaleKeys.author.tr()}: ${model.task?.author.userName ?? ''}(${model.task?.author.email ?? ''})',
                style: AppTypography.sf.s18.w500.black,
              ),
              Text(
                '${LocaleKeys.executor.tr()}: ${model.task?.executor.userName ?? ''}(${model.task?.executor.email ?? ''})',
                style: AppTypography.sf.s18.w500.black,
              ),
              const SizedBox(height: 30),
              Text(
                '${LocaleKeys.description.tr()}: ${model.task?.description ?? '-'.tr()}',
                style: AppTypography.sf.s15.w400.black,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    '${LocaleKeys.timeToDo.tr()}: ',
                    style: AppTypography.sf.s18.w500.black,
                  ),
                  Text(
                    '${model.task?.duration ?? 0} ${LocaleKeys.hours.tr()}',
                    style: AppTypography.sf.s18.w500.black,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    '${LocaleKeys.priceInPoints.tr()}: ',
                    style: AppTypography.sf.s18.w500.black,
                  ),
                  Text(
                    '${model.task?.price ?? 0} points',
                    style: AppTypography.sf.s18.w500.black,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    '${LocaleKeys.createdAt.tr()}: ',
                    style: AppTypography.sf.s18.w500.black,
                  ),
                  Text(
                    model.task?.startTime == null
                        ? '-'
                        : DateFormat('mm:hh dd.MM.yyyy').format(
                            model.task!.startTime.toUtc(),
                          ),
                    style: AppTypography.sf.s18.w500.black,
                  )
                ],
              ),
              const SizedBox(height: 15),
              if (model.task?.isAuthor ?? false || (model.task?.isExecutor ?? false))
                AppSingleFilterWidget<TaskStatus>(
                  availableValues: TaskStatus.values,
                  value: taskStatusfromInt(model.task?.status ?? 0),
                  callback: (item) {
                    if (item?.index == null) return;
                    model.updateTaskStatus(item!.index, id);
                  },
                  buildName: (item) {
                    if (item == null) return '-';
                    return item.title;
                  },
                  title: LocaleKeys.status.tr(),
                  clear: null,
                )
              else
                Row(
                  children: [
                    Text(
                      LocaleKeys.status.tr(),
                      style: AppTypography.sf.s18.w500.black,
                    ),
                    Text(
                      taskStatusfromInt(model.task?.status ?? 0).title,
                      style: AppTypography.sf.s18.w500.black,
                    )
                  ],
                ),
              const SizedBox(height: 15),

              if (model.task?.links.isNotEmpty ?? false) ...[
                Text(
                  LocaleKeys.taskMaterials.tr(),
                  style: AppTypography.sf.s18.w500.black,
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 72,
                  child: GridView(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    children: [
                      ...(model.task?.links ?? []).map(
                        (e) => SizedBox(
                          width: 40,
                          height: 40,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: ColorName.darkGrey),
                            ),
                            child: CupertinoButton(
                              onPressed: () => model.downloadOne(e),
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              child: const Icon(
                                Icons.file_open,
                                color: ColorName.red,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppTextButton(
                    onTap: model.downloadAll,
                    textStyle: AppTypography.sf.s16.w500.red,
                    text: LocaleKeys.downloadAll.tr(),
                  ),
                ),
              ],
              const SizedBox(height: 10),
              if (model.task?.isExecutor ?? false) ...[
                Text(
                  LocaleKeys.note.tr(),
                  style: AppTypography.sf.s16.w500.black,
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 500,
                  height: 200,
                  child: AppTextField(
                    controller: model.noteController,
                    minLines: 8,
                    maxLines: 8,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 200,
                    child: AppButton(
                      onTap: () => model.addNote(context),
                      buttonColor: model.noteController.text == model.task?.note ? ColorName.darkGrey : ColorName.red,
                      textStyle: AppTypography.sf.s18.w500.white,
                      text: LocaleKeys.save.tr(),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 10),

              ///if(model.task?.isExecutor ?? false)
            ],
          ),
        );
      },
    );
  }
}
