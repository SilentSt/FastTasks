import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/domain/di/global_dependency.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/screens/chats/chats_vm.dart';
import 'package:tasklet/presentation/screens/chats/dialogs/add_chat_dialog_model.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';
import 'package:tasklet/presentation/widgets/app_text_button.dart';
import 'package:tasklet/presentation/widgets/app_text_field.dart';

class AddChatDialog extends ViewModelWidget<ChatsViewModel> {
  const AddChatDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ChatsViewModel viewModel) {
    return ViewModelBuilder<AddChatDialogModel>.reactive(
      viewModelBuilder: () => AddChatDialogModel(
        chatService: context.user.chatService,
        authService: context.global.authService,
        errorService: context.global.errorService,
        close: viewModel.hideDialog,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height * .6,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: ColorName.purple.withOpacity(.3),
                    blurRadius: 80,
                    spreadRadius: 50,
                  )
                ],
                color: ColorName.white,
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
                    if (model.isBusy) ...[
                      const SizedBox(),
                      const AppLoading(),
                      const SizedBox(),
                    ] else ...[
                      Text(
                        LocaleKeys.creatingChat.tr(),
                        style: AppTypography.sf.s24.w500.black,
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
                                final user = model.allUsers[index];
                                return SizedBox(
                                  height: 60,
                                  child: ListTile(
                                    title: Text(
                                      user.email,
                                      style: AppTypography.sf.s16.w500.black,
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
                              itemCount: model.allUsers.length,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppTextButton(
                            onTap: ()=>viewModel.hideDialog(),
                            text: LocaleKeys.cancel.tr(),
                            textStyle: AppTypography.sf.s18.w600.copyWith(
                              color: CupertinoColors.destructiveRed,
                            ),
                          ),
                          const SizedBox(width: 20),
                          AppTextButton(
                            onTap: model.createChat,
                            text: LocaleKeys.yes.tr(),
                            textStyle: AppTypography.sf.s18.w600.copyWith(
                              color: ColorName.black,
                            ),
                          ),
                        ],
                      ),
                    ],
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
