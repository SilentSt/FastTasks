import 'package:flutter/material.dart';
import 'package:tasklet/data/data_sources/core/app_local_ds.dart';
import 'package:tasklet/data/data_sources/task/remote_task_ds.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/core/app_service.dart';
import 'package:tasklet/domain/services/core/error_checker_mixin.dart';
import 'package:tasklet/domain/services/core/repo_mixin.dart';

class TaskService extends AppService<BaseLocalDataSource, RemoteTaskDataSource>
    with RepoStyleMixin<TaskDto, TaskModel>, ErrorChecker {
  TaskService(super.lds, super.rds, super.errorService);

  @override
  Future<void> init(BuildContext context) async {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  void dispose() {}

  @override
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

  @override
  Future<void> delete(TaskDto dto) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<TaskModel>> fetch() async {
    final res = await rds.fetch();
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body ?? [];
  }

  @override
  Future<TaskModel> getById(String id) async {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> patch(TaskDto dto) async {
    final res = await rds.edit(dto);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
  }

  
  Future<void> patchStatus(StatusDto dto) async {
    final res = await rds.updateStatus(dto);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
  }

  @override
  Future<List<TaskModel>> fetchById(String id) async {
    final res = await rds.getByTableId(id);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body ?? [];
  }
}
