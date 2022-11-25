import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tasklet/data/data_sources/chart/remote_chart_ds.dart';
import 'package:tasklet/data/data_sources/chat/remote_chat_ds.dart';
import 'package:tasklet/data/data_sources/core/app_local_ds.dart';
import 'package:tasklet/data/data_sources/push/remote_push_ds.dart';
import 'package:tasklet/data/data_sources/table/remote_table_ds.dart';
import 'package:tasklet/data/data_sources/task/remote_task_ds.dart';
import 'package:tasklet/data/data_sources/upload/mobile_upload_ds.dart';
import 'package:tasklet/data/data_sources/upload/web_upload_ds.dart';
import 'package:tasklet/domain/di/global_dependency.dart';
import 'package:tasklet/domain/services/chart_service.dart';
import 'package:tasklet/domain/services/chat_service.dart';
import 'package:tasklet/domain/services/push_notifications_service.dart';
import 'package:tasklet/domain/services/table_service.dart';
import 'package:tasklet/domain/services/task_service.dart';
import 'package:tasklet/domain/services/upload_service.dart';

import 'core/app_async_dependency.dart';

class UserDependency extends AppAsyncDependency {
  late final GlobalDependency _global;
  late final PushNotificationsService _pushNotificationsService;
  late final TableService _tableService;
  late final TaskService _taskService;
  late final ChatService _chatService;
  late final UploadService _uploadService;
  late final ChartService _chartService;

  TableService get tableService => _tableService;
  TaskService get taskService => _taskService;
  ChatService get chatService => _chatService;
  UploadService get uploadService => _uploadService;
  ChartService get chartService => _chartService;

  UserDependency(super.context);

  @override
  Future<void> init(BuildContext context) async {
    _global = context.read<GlobalDependency>();
    final pushRds = RemotePushDataSource.create(_global.chopper);
    final tableRds = RemoteTableDataSource.create(_global.chopper);
    final taskRds = RemoteTaskDataSource.create(_global.chopper);
    final chatRds = RemoteChatDataSource.create(_global.chopper);
    final webDs = WebUploadDataSource();
    final mobileDs = MobileUploadDataSource();
    final chartRds = RemoteChartDataSource.create(_global.chopper);

    try {
      _pushNotificationsService = PushNotificationsService(
        FirebaseMessaging.instance,
        pushRds,
      );
      await _pushNotificationsService.init();
      // ignore: empty_catches
    } catch (e) {
      
    }

    
    _tableService = TableService(
      BaseLocalDataSource(),
      tableRds,
      _global.errorService,
    );
    _taskService = TaskService(
      BaseLocalDataSource(),
      taskRds,
      _global.errorService,
    );
    _chatService = ChatService(
      BaseLocalDataSource(),
      chatRds,
      _global.errorService,
    );
    _uploadService = UploadService(
      webDs,
      mobileDs,
      _global.errorService,
    );
    _chartService = ChartService(
      BaseLocalDataSource(),
      chartRds,
      _global.errorService,
    );
  }

  @override
  void dispose() {
    _tableService.dispose();
    _taskService.dispose();
  }
}

extension UserReader on BuildContext {
  UserDependency get user => read<UserDependency>();
}
