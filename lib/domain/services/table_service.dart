import 'package:flutter/material.dart';
import 'package:tasklet/data/data_sources/core/app_local_ds.dart';
import 'package:tasklet/data/data_sources/table/remote_table_ds.dart';
import 'package:tasklet/data/models/table/table_dto.dart';
import 'package:tasklet/data/models/table/table_model.dart';
import 'package:tasklet/domain/services/core/app_service.dart';
import 'package:tasklet/domain/services/core/error_checker_mixin.dart';
import 'package:tasklet/domain/services/core/repo_mixin.dart';

class TableService
    extends AppService<BaseLocalDataSource, RemoteTableDataSource>
    with RepoStyleMixin<TableDto, TableModel>, ErrorChecker {
  TableService(super.lds, super.rds, super.errorService);

  @override
  Future<void> init(BuildContext context) async {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> add(TableDto dto) async {
    final res = await rds.add(dto);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
  }

  @override
  Future<void> delete(TableDto dto) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<TableModel>> fetch() async {
    final res = await rds.fetch();
    final checked = errorChecker(res, nullableBody: false);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body ?? [];
  }

  @override
  Future<List<TableModel>> fetchById(String id) async {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<TableModel> getById(String id) async {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<void> patch(TableDto dto) async {
    final res = await rds.edit(dto);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
