import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/auth_service.dart';
import 'package:tasklet/domain/services/table_service.dart';
import 'package:tasklet/domain/services/task_service.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_text_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DashboardsViewModel extends BaseViewModel {
  DashboardsViewModel({
    required this.tableService,
    required this.taskService,
    required this.authService,
  });
  List<TableModel> tables = [];
  List<TaskModel> tasks = [];
  List<bool> expansions = [];
  // static const _signalRAddress = 'https://sbeusilent.space/taskhub';
  final TableService tableService;
  final TaskService taskService;
  final AuthService authService;
  final TextEditingController noteController = TextEditingController();

  bool addDashVisible = false;
  bool addTaskVisible = false;
  bool isLoadingMore = false;
  TableModel? editableTable;
  TaskModel? ediatableTask;
  Timer? fetcher;
  TableModel? currentTable;

  Future<void> onReady() async {
    await fetchDashboards();
  }

  Future<void> fetchDashboards() async {
    setBusy(true);
    final res = await tableService.fetch();
    if (res.isNotEmpty) {
      tables = res;
      currentTable = tables.first;
      tasks.clear();
      await fetchTasksFromCurrentTable();
    }
    setBusy(false);
  }

  Future<void> fetchTasksFromCurrentTable() async {
    if (isLoadingMore) return;
    isLoadingMore = true;
    notifyListeners();
    if (currentTable == null) {
      setBusy(false);
      return;
    }
    final res = await taskService.fetchById(currentTable!.id, tasks.length, 30);
    currentTable = currentTable!.copyWith(tasks: [
      ...tasks,
      ...res,
    ]);
    tasks.addAll(currentTable?.tasks ?? []);
    tasks.sort(
      (a, b) => a.status.compareTo(b.status),
    );
    expansions.clear();
    for (final _ in tasks) {
      expansions.add(false);
    }
    isLoadingMore = false;
    notifyListeners();
  }

  void onAddDashShow({TableModel? task}) {
    addDashVisible = true;
    editableTable = task;
    notifyListeners();
  }

  void onAddDashHide() async {
    addDashVisible = false;
    await fetchDashboards();
    notifyListeners();
  }

  void onAddTaskShow({TaskModel? task}) {
    addTaskVisible = true;
    ediatableTask = task;
    notifyListeners();
  }

  void onAddTaskHide() async {
    addTaskVisible = false;
    ediatableTask = null;
    await fetchDashboards();
    notifyListeners();
  }

  void updateExp(int index) {
    expansions[index] = !expansions[index];
    notifyListeners();
  }

  Future<void> downloadAll(List<String> urls) async {
    for (final uri in urls) {
      await launchUrlString(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> downloadOne(String url) async {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  }

  Future<void> addNote(BuildContext context, TaskModel task) async {
    final res = await showCupertinoDialog<String>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            LocaleKeys.noteCreating.tr(),
            style: AppTypography.sf.s18.w500.black,
          ),
          content: Card(
            elevation: 0,
            child: CupertinoTextField(
              controller: noteController,
              maxLines: 4,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: AppTextButton(
                onTap: Navigator.of(context).pop,
                text: LocaleKeys.cancel.tr(),
                textStyle: AppTypography.sf.s14.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: AppTextButton(
                onTap: () => Navigator.of(context).pop(noteController.text),
                text: LocaleKeys.yes.tr(),
                textStyle: AppTypography.sf.s14.green,
              ),
            ),
          ],
        );
      },
    );
    noteController.clear();
    if (res == null) {
      return;
    }
    await taskService.addNote(NoteDto(text: res, taskId: task.id));
    fetchTasksFromCurrentTable();
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
    await taskService.patchStatus(StatusDto(status: taskStatus, id: id));
    fetchTasksFromCurrentTable();
  }

  void selectTable(TableModel table) {
    currentTable = table;
    tasks.clear();
    fetchTasksFromCurrentTable();
    notifyListeners();
  }

  @override
  void dispose() {
    noteController.dispose();
    fetcher?.cancel();
    fetcher = null;
    //_signalRConnection.stop();
    super.dispose();
  }
}
