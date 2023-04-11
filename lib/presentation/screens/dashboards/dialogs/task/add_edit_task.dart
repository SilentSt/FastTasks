import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/di/global_dependency.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/screens/dashboards/dashboards_vm.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_icon_button.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';
import 'package:tasklet/presentation/widgets/app_text_button.dart';
import 'package:tasklet/presentation/widgets/app_text_field.dart';

import 'add_edit_task_vm.dart';

class AddEditTaskDialog extends ViewModelWidget<DashboardsViewModel> {
  const AddEditTaskDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, DashboardsViewModel viewModel) {
    if (!viewModel.addTaskVisible) return const SizedBox();
    return ViewModelBuilder<AddEditTaskViewModel>.reactive(
      viewModelBuilder: () => AddEditTaskViewModel(
        close: viewModel.onAddTaskHide,
        errorService: context.global.errorService,
        taskService: context.user.taskService,
        table: viewModel.currentTable!,
        uploadService: context.user.uploadService,
        taskModel: viewModel.ediatableTask,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, _) {
        return Positioned(
          width: MediaQuery.of(context).size.width * .8,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height - 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: ColorName.black.withOpacity(.2),
                        blurRadius: 12,
                        spreadRadius: 20,
                      )
                    ],
                    color: CupertinoColors.darkBackgroundGray),
                child: Column(
                  children: [
                    if (model.isBusy) ...[
                      const SizedBox(),
                      const AppLoading(),
                      const SizedBox(),
                    ] else ...[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            model.taskModel != null ? LocaleKeys.editTask.tr() : LocaleKeys.addTask.tr(),
                            style: AppTypography.sf.s24.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 16,
                          ),
                          children: [
                            Text(
                              LocaleKeys.title.tr(),
                              style: AppTypography.sf.s18.w500,
                            ),
                            const SizedBox(height: 5),
                            AppTextField.auth(
                              controller: model.titleController,
                              height: 70,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              LocaleKeys.description.tr(),
                              style: AppTypography.sf.s18.w500,
                            ),
                            const SizedBox(height: 5),
                            AppTextField.auth(
                              controller: model.descriptionController,
                              height: 100,
                              maxLines: 4,
                            ),
                            const SizedBox(height: 20),
                            AppTextField(
                              title: LocaleKeys.taskDuration.tr(),
                              controller: model.durationController,
                            ),
                            const SizedBox(height: 20),
                            AppTextField(
                              title: 'Поинты за задачу'.tr(),
                              controller: model.priceController,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              LocaleKeys.files.tr(),
                              style: AppTypography.sf.s18.w500,
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 150,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: ColorName.grey),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.separated(
                                        padding: const EdgeInsets.all(5),
                                        itemBuilder: (context, index) {
                                          final link = model.links[index];
                                          return SizedBox(
                                            height: 50,
                                            child: ListTile(
                                              leading: const Icon(
                                                Icons.file_open,
                                                color: ColorName.purple,
                                              ),
                                              title: Text(
                                                link,
                                                style: AppTypography.sf.s16.w500,
                                                overflow: TextOverflow.fade,
                                              ),
                                              trailing: AppIconButton(
                                                onTap: () => model.onRemoveLink(index),
                                                iconWidget: const Icon(
                                                  CupertinoIcons.clear,
                                                  color: ColorName.red,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                                        itemCount: model.links.length,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: AppIconButton(
                                          onTap: model.onFilePicked,
                                          iconWidget: const Icon(
                                            CupertinoIcons.add,
                                            color: ColorName.green,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              LocaleKeys.executor.tr(),
                              style: AppTypography.sf.s18.w500,
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 150,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: ColorName.grey),
                                ),
                                child: ListView.separated(
                                  padding: const EdgeInsets.all(5),
                                  itemBuilder: (context, index) {
                                    final user = model.users[index];
                                    return SizedBox(
                                      height: 40,
                                      child: ListTile(
                                        title: Text(
                                          user.email,
                                          style: AppTypography.sf.s16.w500,
                                        ),
                                        subtitle: Text(
                                          user.userName ?? '',
                                          style: AppTypography.sf.s14.w400.grey,
                                        ),
                                        trailing: CupertinoSwitch(
                                          value: model.selectedUser == user,
                                          activeColor: ColorName.purple,
                                          onChanged: (_) => model.onUserSelected(user),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                                  itemCount: model.users.length,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ListTile(
                              title: Text(
                                LocaleKeys.hidden.tr(),
                                style: AppTypography.sf.s18.w500,
                              ),
                              trailing: CupertinoSwitch(
                                value: model.hidden,
                                onChanged: model.onHiddenTapped,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppTextButton(
                              onTap: () => viewModel.onAddTaskHide(),
                              text: LocaleKeys.cancel.tr(),
                              textStyle: AppTypography.sf.s18.w600.copyWith(
                                color: ColorName.darkGrey,
                              ),
                            ),
                            const SizedBox(width: 20),
                            AppTextButton(
                              onTap: model.onCreate,
                              text: LocaleKeys.yes.tr(),
                              textStyle: AppTypography.sf.s18.w600.copyWith(
                                color: ColorName.purple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
