// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_table_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteTableDataSource extends RemoteTableDataSource {
  _$RemoteTableDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteTableDataSource;

  @override
  Future<Response<List<TableModel>>> fetch() {
    final Uri $url = Uri.parse('Table');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<TableModel>, TableModel>($request);
  }

  @override
  Future<Response<dynamic>> add(TableDto dto) {
    final Uri $url = Uri.parse('Table');
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
  Future<Response<dynamic>> edit(TableDto dto) {
    final Uri $url = Uri.parse('Table');
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
