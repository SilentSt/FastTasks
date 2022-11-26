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
    return ViewModelBuilder<TaskViewModel>.reactive(
      viewModelBuilder: () => TaskViewModel(taskService: context.user.taskService, id: id),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            leading: AppBackButton(
              onTap: () => context.router.pop(),
            ),
          ),
          body: Column(
            children: [
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * .4,
                      ),
                      child: Text(
                        model.task?.title ?? '',
                        overflow: TextOverflow.fade,
                        style: AppTypography.sf.s24.w600.black.copyWith(
                          color: model.colorBuilder(
                            taskStatusfromInt(
                              model.task?.status ?? 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(children: [
                      // if (model.task?.isAuthor??false)
                      //   AppIconButton(
                      //     onTap: () => model.onAddTaskShow(task: model.task?),
                      //     iconWidget: const Icon(
                      //       Icons.edit_note,
                      //       size: 30,
                      //       color: ColorName.red,
                      //     ),
                      //   ),
                      if (model.task?.isExecutor ?? false)
                        AppIconButton(
                          onTap: () => model.addNote(context),
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
                leading: (model.task?.links.isNotEmpty ?? false)
                    ? SizedBox(
                        width: 40,
                        child: AppIconButton(
                          onTap: () => model.downloadAll(model.task?.links ?? []),
                          iconWidget: Icon(
                            Icons.file_download,
                            color: ColorName.red.withOpacity(0.7),
                          ),
                        ),
                      )
                    : const SizedBox(
                        width: 40,
                      ),
                subtitle: Text(
                  '${model.task?.executor.userName} (${model.task?.executor.email})',
                  style: AppTypography.sf.s14.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.description.tr(),
                      style: AppTypography.sf.s18,
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        model.task?.description ?? '-',
                        style: AppTypography.sf.s14.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      LocaleKeys.files.tr(),
                      style: AppTypography.sf.s18,
                    ),
                    const SizedBox(height: 5),
                    for (final link in model.task?.links ?? [])
                      ListTile(
                        leading: AppIconButton(
                          onTap: () => model.downloadOne(link),
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
                    if (model.task?.note != null && (model.task?.note!.isNotEmpty ?? false)) ...[
                      Text(
                        LocaleKeys.note.tr(),
                        style: AppTypography.sf.s18,
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          model.task?.note ?? '-',
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
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          if (model.task?.status != 0)
                            AppIconButton(
                              onTap: () {
                                if (model.task?.status == null || model.task?.id == null) return;
                                model.updateTaskStatus(
                                  model.task!.status - 1,
                                  model.task!.id,
                                );
                              },
                              iconWidget: const Icon(
                                Icons.arrow_back_ios,
                                color: ColorName.green,
                                size: 30,
                              ),
                            ),
                          Text(
                            taskStatusfromInt(
                              model.task?.status ?? 0,
                            ).title,
                            style: AppTypography.sf.s14,
                          ),
                          if (model.task?.status != 4)
                            AppIconButton(
                              onTap: () {
                                if (model.task?.status == null || model.task?.id == null) return;
                                model.updateTaskStatus(
                                  model.task!.status + 1,
                                  model.task!.id,
                                );
                              },
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
            ],
          ),
        );
      },
    );
  }
}
