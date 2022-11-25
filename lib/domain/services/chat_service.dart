import 'package:flutter/material.dart';
import 'package:tasklet/data/data_sources/chat/remote_chat_ds.dart';
import 'package:tasklet/data/data_sources/core/app_local_ds.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/core/app_service.dart';
import 'package:tasklet/domain/services/core/error_checker_mixin.dart';
import 'package:tasklet/domain/services/core/repo_mixin.dart';

class ChatService extends AppService<BaseLocalDataSource, RemoteChatDataSource>
    with RepoStyleMixin<ChatDto, ChatModel>, ErrorChecker {
  ChatService(super.lds, super.rds, super.errorService);

  @override
  Future<void> init(BuildContext context) async {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> add(ChatDto dto) async {
    final res = await rds.add(dto);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
  }

  Future<void> sendMessage(MessageDto dto) async {
    final res = await rds.sendMessage(dto);
    final checked = errorChecker(res);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
  }

  @override
  Future<void> delete(ChatDto dto) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<ChatModel>> fetch() async {
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
  Future<List<ChatModel>> fetchById(String id) async {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<ChatModel?> getById(String id) async {
    final res = await rds.getById(id);
    final checked = errorChecker(res, nullableBody: false);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body;
  }

  Future<List<MessageModel>> history(String id) async {
    final res = await rds.history(id);
    final checked = errorChecker(res, nullableBody: false);
    if (!checked) {
      await errorService.showEror(
        error: '[${res.statusCode}] ${res.base.reasonPhrase}',
      );
    }
    return res.body ?? [];
  }

  @override
  Future<void> patch(ChatDto dto) async {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
