import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/assets.gen.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/screens/chats/dialogs/add_chat_dialog.dart';
import 'package:tasklet/presentation/screens/chats/shimmer/chats_shimmer.dart';
import 'package:tasklet/presentation/screens/root/providers/hide_provider.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_icon_button.dart';

import 'chats_vm.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatsViewModel>.reactive(
      viewModelBuilder: () => ChatsViewModel(
        chatService: context.user.chatService,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.chats.tr()),
              automaticallyImplyLeading: false,
            ),
            
            body: const ChatsShimmer(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.chats.tr()),
            actions: [
              AppIconButton(
                onTap: model.showDialog,
                iconWidget: const Icon(
                  CupertinoIcons.add_circled,
                  color: ColorName.red,
                  size: 28,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              if (model.chats.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.asset(
                        Assets.animations.empty,
                        height: 100,
                      ),
                      const SizedBox(height: 50),
                      Text(
                        LocaleKeys.emptyChats.tr(),
                        style: AppTypography.sf.grey.s18.w500,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              else
                ListView.separated(
                  itemBuilder: (_, index) {
                    final chat = model.chats[index];
                    return SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: CupertinoButton(
                        onPressed: () {
                          context.read<HideProvider>().ignore = true;
                          model.onChatTapped(chat.id);
                        },
                        padding: EdgeInsets.zero,
                        borderRadius: BorderRadius.zero,
                        color: Colors.transparent,
                        minSize: 0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorName.red.withOpacity(.15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            chat.title ?? '',
                                            style: AppTypography.sf.s24.w600.black,
                                            overflow: TextOverflow.fade,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            (chat.lastMessage ?? '').trim(),
                                            style: AppTypography.sf.s22.w400.black,
                                            overflow: TextOverflow.fade,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Text(
                                //   chat.lastMessage?.createdAt == null
                                //       ? DateFormat('dd.MM.yy')
                                //           .format(DateTime.now())
                                //       : DateFormat('dd.MM.yy')
                                //           .format(chat.lastMessage!.createdAt),
                                //   style: AppTypography.sf.s12.w300.grey,
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                  itemCount: model.chats.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              if (model.creatingDialogVisible) const AddChatDialog(),
            ],
          ),
        );
      },
    );
  }
}
