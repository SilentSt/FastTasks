import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/chat/chat.dart';
import 'package:tasklet/data/models/user/user_model.dart';
import 'package:tasklet/domain/services/auth_service.dart';
import 'package:tasklet/domain/services/chat_service.dart';
import 'package:tasklet/domain/services/error_service.dart';
import 'package:tasklet/gen/locale_keys.g.dart';

class AddChatDialogModel extends BaseViewModel {
  AddChatDialogModel({
    required this.chatService,
    required this.authService,
    required this.errorService,
    required this.close,
  });

  final ChatService chatService;
  final AuthService authService;
  final ErrorService errorService;
  final VoidCallback close;
  final TextEditingController titleController = TextEditingController();
  List<UserModel> allUsers = [];
  List<UserModel> selectedUsers = [];

  Future<void> onReady() async {
    setBusy(true);
    allUsers = await authService.fetchUsers();
    setBusy(false);
  }

  Future<void> createChat() async {
    setBusy(true);
    if (selectedUsers.isEmpty) {
      errorService.showEror(error: LocaleKeys.chatWithEmptyUsers.tr());
      setBusy(false);
      return;
    }
    if (selectedUsers.length > 2 && titleController.text.trim().isEmpty) {
      errorService.showEror(error: LocaleKeys.groupChatWithoutTitle.tr());
      setBusy(false);
      return;
    }
    if (selectedUsers.length > 2) {
      chatService.add(
        ChatDto(
          name: titleController.text,
          userIds: selectedUsers.map((e) => e.id).toList(),
          private: false,
        ),
      );
    } else {
      chatService.add(
        ChatDto(
          userIds: selectedUsers.map((e) => e.id).toList(),
          private: true,
        ),
      );
    }
    setBusy(false);
    close();
  }

  void onUsersSelected(UserModel? selected) {
    if (selected == null) return;
    if (selectedUsers.contains(selected)) {
      selectedUsers.remove(selected);
    } else {
      selectedUsers.add(selected);
    }
    notifyListeners();
  }
}
