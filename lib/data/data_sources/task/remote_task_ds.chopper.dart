// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_task_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteTaskDataSource extends RemoteTaskDataSource {
  _$RemoteTaskDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteTaskDataSource;

  @override
  Future<Response<List<TaskModel>>> fetch() {
    final String $url = 'Task';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<TaskModel>, TaskModel>($request);
  }

  @override
  Future<Response<List<TaskModel>>> getByTableId(String tableId) {
    final String $url = 'Task/${tableId}';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<TaskModel>, TaskModel>($request);
  }

  @override
  Future<Response<dynamic>> add(TaskDto dto) {
    final String $url = 'Task';
    final $body = dto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addNote(NoteDto dto) {
    final String $url = 'Task/note';
    final $body = dto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> edit(TaskDto dto) {
    final String $url = 'Task';
    final $body = dto;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateStatus(StatusDto dto) {
    final String $url = 'Task';
    final $body = dto;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
