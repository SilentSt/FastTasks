import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/chat_service.dart';
import 'package:tasklet/presentation/app/app.dart';


class ChatViewModel extends BaseViewModel {
  ChatViewModel({
    required this.chatId,
    required this.chatService,
  });

  final ChatService chatService;
  final String chatId;
  final messageController = TextEditingController();
  List<MessageModel> messages = [];
  Timer? fetcher;
  ChatModel? chat;
  int? maxLines;
  Future<void> onReady() async {
    setBusy(true);
    await fetchChat();
    messageController.addListener(
      () {
        if (messageController.text.length < 80) {
          if (maxLines == null) return;
          maxLines = null;
          notifyListeners();
        }
        if (messageController.text.length < 120) {
          if (maxLines == 2) return;
          maxLines = 2;
          notifyListeners();
        } else if (messageController.text.length < 160) {
          if (maxLines == 3) return;
          maxLines = 3;
          notifyListeners();
        } else if (maxLines != 4) {
          maxLines = 4;
          notifyListeners();
        }
      },
    );
    setBusy(false);
    await fetchMessages();
    fetcher = Timer.periodic(
      const Duration(seconds: 3),
      (_) => fetchMessages(),
    );
  }

  Future<void> fetchChat() async {
    chat = await chatService.getById(chatId);
  }

  Future<void> fetchMessages() async {
    messages = await chatService.history(chatId);
    notifyListeners();
  }

  void pop(BuildContext context) {
    App.router.navigateBack();
  }


  Future<void> sendMessage() async {
    await chatService.sendMessage(
      MessageDto(
        text: messageController.text,
        chatId: chatId,
      ),
    );
    messageController.clear();
  }

  @override
  void dispose() {
    fetcher?.cancel();
    fetcher = null;
    super.dispose();
  }
}
