import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/domain/di/global_dependency.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/screens/dashboards/dashboards_vm.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';
import 'package:tasklet/presentation/widgets/app_text_button.dart';
import 'package:tasklet/presentation/widgets/app_text_field.dart';

import 'add_edit_dashboard_vm.dart';

class AddEditDashDialog extends ViewModelWidget<DashboardsViewModel> {
  const AddEditDashDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, DashboardsViewModel viewModel) {
    if (!viewModel.addDashVisible) return const SizedBox();
    return ViewModelBuilder<AddEditDashboardViewModel>.reactive(
      viewModelBuilder: () => AddEditDashboardViewModel(
        close: viewModel.onAddDashHide,
        authService: context.global.authService,
        errorService: context.global.errorService,
        tableService: context.user.tableService,
        tableModel: viewModel.editableTable,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, _) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height * .8,
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
                color: CupertinoColors.darkBackgroundGray
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      viewModel.editableTable != null
                          ? LocaleKeys.editDashboard.tr()
                          : LocaleKeys.addDashboard.tr(),
                      style: AppTypography.sf.s24.w500,
                    ),
                    AppTextField(
                      controller: model.titleController,
                      title: LocaleKeys.title.tr(),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ColorName.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: ListView.separated(
                            padding: const EdgeInsets.all(5),
                            itemBuilder: (context, index) {
                              final user = model.users[index];
                              return SizedBox(
                                height: 60,
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
                                    value: model.selectedUsers.contains(user),
                                    activeColor: ColorName.purple,
                                    onChanged: (_) =>
                                        model.onUsersSelected(user),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 10),
                            itemCount: model.users.length,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppTextButton(
                          onTap: () => viewModel.onAddDashHide(),
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
