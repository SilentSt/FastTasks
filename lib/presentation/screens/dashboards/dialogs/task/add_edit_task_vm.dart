import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/error_service.dart';
import 'package:tasklet/domain/services/task_service.dart';
import 'package:tasklet/domain/services/upload_service.dart';
import 'package:tasklet/gen/locale_keys.g.dart';

class AddEditTaskViewModel extends BaseViewModel {
  AddEditTaskViewModel({
    required this.close,
    required this.taskService,
    required this.errorService,
    required this.table,
    required this.uploadService,
    required this.taskModel,
  });

  final VoidCallback close;
  final TableModel table;
  final TaskService taskService;
  final ErrorService errorService;
  final UploadService uploadService;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<UserModel> users = [];
  List<String> links = [];
  UserModel? selectedUser;
  final TaskModel? taskModel;
  TaskDuration taskDuration = TaskDuration.day;
  bool hidden = false;

  Future<void> onReady() async {
    setBusy(true);
    users = table.users;
    if (taskModel == null) {
      setBusy(false);
      return;
    }
    selectedUser = taskModel!.executor;
    titleController.text = taskModel!.title;
    descriptionController.text = taskModel!.title;
    hidden = taskModel!.hidden;
    links = taskModel!.links;
    taskDuration = fromApi(taskModel!.duration) ?? TaskDuration.day;
    setBusy(false);
  }

  Future<void> onCreate() async {
    if (titleController.text.trim().isEmpty) {
      await errorService.showEror(error: LocaleKeys.emptyTitleError.tr());
      return;
    }
    if (descriptionController.text.trim().isEmpty) {
      await errorService.showEror(error: LocaleKeys.emptyDescriptionError.tr());
      return;
    }
    if (selectedUser == null) {
      await errorService.showEror(error: LocaleKeys.emptyTaskExecutor.tr());
      return;
    }
    if (taskModel == null) {
      await taskService.add(
        TaskDto(
          executorId: selectedUser!.id,
          title: titleController.text.trim(),
          hidden: hidden,
          links: links,
          description: descriptionController.text.trim(),
          tableId: table.id,
          duration: taskDuration.toApi,
        ),
      );
    } else {
      await taskService.patch(
        TaskDto(
          executorId: selectedUser!.id,
          title: titleController.text.trim(),
          hidden: hidden,
          links: links,
          description: descriptionController.text.trim(),
          tableId: table.id,
          status: taskModel!.status,
          id: taskModel!.id,
          duration: taskDuration.toApi,
        ),
      );
    }
    close();
  }

  Future<void> onFilePicked() async {
    final file = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (file == null) return;
    for (final f in file.files) {
      final res = await uploadService.uploadFile(f);
      if (res == null) continue;
      links.add(res);
    }
    notifyListeners();
  }

  void onUserSelected(UserModel? user) {
    selectedUser = user;
    notifyListeners();
  }

  void onHiddenTapped(bool value) {
    hidden = value;
    notifyListeners();
  }

  void onSelectDuration(TaskDuration? dur) {
    if (dur == null) return;
    taskDuration = dur;
    notifyListeners();
  }

  void onRemoveLink(int index) {
    if (links.length > index) {
      links.removeAt(index);
    }
    notifyListeners();
  }
}
