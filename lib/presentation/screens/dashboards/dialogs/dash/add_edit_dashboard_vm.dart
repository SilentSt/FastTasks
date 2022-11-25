import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/auth_service.dart';
import 'package:tasklet/domain/services/error_service.dart';
import 'package:tasklet/domain/services/table_service.dart';
import 'package:tasklet/gen/locale_keys.g.dart';

class AddEditDashboardViewModel extends BaseViewModel {
  AddEditDashboardViewModel({
    required this.close,
    required this.tableService,
    required this.authService,
    required this.errorService,
    required this.tableModel,
  });
  final VoidCallback close;
  final TableService tableService;
  final AuthService authService;
  final ErrorService errorService;
  final TextEditingController titleController = TextEditingController();
  final TableModel? tableModel;
  List<UserModel> users = [];
  List<UserModel> selectedUsers = [];

  Future<void> onReady() async {
    users = await authService.fetchUsers();
    if (tableModel != null) {
      selectedUsers = tableModel!.users;
      titleController.text = tableModel!.title;
    }
    notifyListeners();
  }

  Future<void> onCreate() async {
    if (titleController.text.trim().isEmpty) {
      await errorService.showEror(error: LocaleKeys.emptyTitleError.tr());
      return;
    }
    if (selectedUsers.isEmpty) {
      await errorService.showEror(error: LocaleKeys.emptyUsersListError.tr());
      return;
    }
    if (tableModel == null) {
      await tableService.add(
        TableDto(
          title: titleController.text,
          users: selectedUsers,
        ),
      );
    } else {
      await tableService.patch(
        TableDto(
          id: tableModel!.id,
          title: titleController.text,
          users: selectedUsers,
        ),
      );
    }
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

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }
}
