import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/chat_service.dart';
import 'package:tasklet/presentation/app/app.dart';
import 'package:tasklet/presentation/navigation/app_router.dart';

class ChatsViewModel extends BaseViewModel {
  ChatsViewModel({
    required this.chatService,
  });

  final ChatService chatService;

  List<ChatModel> chats = [];
  Timer? fetcher;
  bool creatingDialogVisible = false;

  Future<void> onReady() async {
    setBusy(true);
    await fetchChats();
    setBusy(false);
    fetcher = Timer.periodic(
      const Duration(seconds: 5),
      (_) => fetchChats,
    );
  }

  Future<void> onChatTapped(String chatId) async {

    App.router.navigate(ChatViewRoute(id: chatId));
  }

  Future<void> fetchChats() async {
    chats = await chatService.fetch();
    notifyListeners();
  }

  void showDialog() {
    creatingDialogVisible = true;
    runBusyFuture(fetchChats());
    notifyListeners();
  }

  void hideDialog() {
    creatingDialogVisible = false;
    runBusyFuture(fetchChats());
    notifyListeners();
  }

  @override
  void dispose() {
    fetcher?.cancel();
    fetcher = null;
    super.dispose();
  }
}
