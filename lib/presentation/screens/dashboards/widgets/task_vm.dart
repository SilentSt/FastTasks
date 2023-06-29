import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/error_service.dart';
import 'package:tasklet/domain/services/task_service.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TaskViewModel extends BaseViewModel {
  TaskViewModel({
    required this.taskService,
    required this.id,
    required this.errorService,
  });

  final TaskService taskService;
  final ErrorService errorService;
  final TextEditingController noteController = TextEditingController();
  final String id;
  final List<String> statuses = ["New","Doing","Review","Done","Closed"];
  TaskModel? task;

  Future<void> onReady() async {
    setBusy(true);
    await fetchtask();
    noteController.addListener(() => notifyListeners());
    setBusy(false);
  }

  Future<void> fetchtask() async {
    task = await taskService.fetchTaskId(id);
    noteController.text = task?.note ?? '';
    notifyListeners();
  }

  Future<void> downloadAll() async {
    if (task?.links.isEmpty ?? false) {
      errorService.showEror(error: 'В этой задачи нет вложений');
      return;
    }
    for (final uri in task!.links) {
      await launchUrlString(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> downloadOne(String url) async {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  }

  Future<void> addNote(BuildContext context) async {
    await taskService.addNote(NoteDto(text: noteController.text, taskId: id));
    fetchtask();
  }

  Color colorBuilder(TaskStatus status) {
    switch (status) {
      case TaskStatus.n:
        return ColorName.grey;
      case TaskStatus.i:
        return ColorName.green;
      case TaskStatus.r:
        return ColorName.red;
      case TaskStatus.d:
        return ColorName.purple;
      case TaskStatus.c:
        return ColorName.blue;
    }
  }

  Future<void> updateTaskStatus(int taskStatus, String id) async {
    await taskService.patchStatus(StatusModel(status: statuses[taskStatus], id: id));
    fetchtask();
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }
}
