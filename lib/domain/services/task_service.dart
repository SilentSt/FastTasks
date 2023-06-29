import 'package:flutter/material.dart';
import 'package:tasklet/data/data_sources/core/app_local_ds.dart';
import 'package:tasklet/data/data_sources/task/remote_task_ds.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/core/app_service.dart';
import 'package:tasklet/domain/services/core/error_checker_mixin.dart';

class TaskService extends AppService<BaseLocalDataSource, RemoteTaskDataSource> with ErrorChecker {
  TaskService(super.lds, super.rds, super.errorService);

  @override
  Future<void> init(BuildContext context) async {}

  @override
  void dispose() {}

  Future<void> add(TaskDto dto) async {
    final res = await rds.add(dto);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
  }

  Future<void> addNote(NoteDto dto) async {
    final res = await rds.addNote(dto);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
  }

  Future<List<TaskModel>> fetch(int skip, int take) async {
    final res = await rds.fetch(skip, take);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body ?? [];
  }

  Future<void> patch(TaskDto dto) async {
    final res = await rds.edit(dto);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
  }

  Future<void> patchStatus(StatusModel dto) async {
    final res = await rds.updateStatus(dto);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
  }

  Future<List<TaskModel>> fetchById(String id, int skip, int take) async {
    final res = await rds.getByTableId(id, skip, take);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body ?? [];
  }

  Future<TaskModel?> fetchTaskId(String id) async {
    final res = await rds.getTaskById(id);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body;
  }
}
