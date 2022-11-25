import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/assets.gen.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/screens/chats/chat/shimmers/chat_messages_shimmer.dart';
import 'package:tasklet/presentation/screens/chats/chat/shimmers/chat_title_shimmer.dart';
import 'package:tasklet/presentation/screens/root/providers/hide_provider.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_back_button.dart';
import 'package:tasklet/presentation/widgets/app_icon_button.dart';

import 'chat_vm.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    Key? key,
    @PathParam('id') required this.id,
  }) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
      viewModelBuilder: () => ChatViewModel(
        chatId: id,
        chatService: context.user.chatService,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        context.read<HideProvider>().ignore = false;

        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (model.isBusy)
              Scaffold(
                appBar: AppBar(
                  // leading: AppBackButton(
                  //   onTap: () => model.pop(context),
                  // ),
                  title: const ChatTitleShimmer(),
                ),
                body: const ChatMessagesShimmer(),
              )
            else if (model.messages.isEmpty)
              Scaffold(
                appBar: AppBar(
                  leading: AppBackButton(
                    onTap: () => model.pop(context),
                  ),
                  title: Text(
                    model.chat?.title ?? '',
                  ),
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LottieBuilder.asset(
                          Assets.animations.empty,
                          height: 300,
                        ),
                        const SizedBox(height: 50),
                        Text(
                          LocaleKeys.emptyMessages.tr(),
                          style: AppTypography.sf.grey.s16.w400,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              Scaffold(
                appBar: AppBar(
                  leading: AppBackButton(
                    onTap: () => model.pop(context),
                  ),
                  title: Text(
                    model.chat?.title ?? '',
                  ),
                ),
                body: ListView.separated(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).padding.bottom + 90,
                  ),
                  itemBuilder: (context, index) {
                    final message = model.messages.toList()[index];
                    return Align(
                      alignment: (message.self ?? false)
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: (message.self ?? false)
                              ? ColorName.purple.withOpacity(.2)
                              : ColorName.blue.withOpacity(.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 250,
                                child: Text(message.text),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  DateFormat('hh:mm').format(
                                    message.time.toLocal(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  reverse: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: model.messages.length,
                ),
              ),
            Positioned(
              bottom: 10 + MediaQuery.of(context).padding.bottom + MediaQuery.of(context).viewInsets.bottom,
              child: Card(
                shadowColor: ColorName.red.withOpacity(.5),
                color: ColorName.white,
                surfaceTintColor: ColorName.red.withOpacity(.8),
                elevation: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 340 > MediaQuery.of(context).size.width ? MediaQuery.of(context).size.width : 340,

                      child: TextField(
                        maxLines: model.maxLines,
                        controller: model.messageController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          hintText: 'Text',
                          contentPadding: EdgeInsets.only(
                            left: 8,
                            top: 8,
                            right: 8,
                          ),
                        ),
                      ),
                    ),
                    AppIconButton(
                      onTap: model.sendMessage,
                      iconWidget: const Icon(
                        Icons.send,
                        color: ColorName.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
