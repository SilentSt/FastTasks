import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/task_service.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_text_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required this.taskService,
  });

  Future<void> onReady() async {
    setBusy(true);
    await fetchMyTasks();
    setBusy(false);
    scrollController.addListener(() {
      scrollController.addListener(() {
        if (!(scrollController.offset >= scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange)) return;
        fetchMyTasks();
      });
    });
  }

  final TaskService taskService;
  final TextEditingController noteController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final List<String> statuses = ["New","Doing","Review","Done","Closed"];
  bool isLoadingMore = false;
  List<TaskModel> myTasks = [];
  List<bool> expansions = [];

  Future<void> fetchMyTasks() async {
    if (isLoadingMore) return;
    isLoadingMore = true;
    notifyListeners();
    final newTasks = await taskService.fetch(myTasks.length, 30);
    myTasks.addAll(newTasks);
    myTasks.sort(
      (a, b) => a.status.compareTo(b.status),
    );
    for (final _ in myTasks) {
      expansions.add(false);
    }
    isLoadingMore = false;
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
    fetchMyTasks();
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
    await taskService.patchStatus(StatusDto(status:statuses[taskStatus], id: id));
    fetchMyTasks();
  }

  @override
  void dispose() {
    noteController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
