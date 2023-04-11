// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_auth_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteAuthDataSource extends RemoteAuthDataSource {
  _$RemoteAuthDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteAuthDataSource;

  @override
  Future<Response<UserAuthModel>> auth(UserAuthDto dto) {
    final Uri $url = Uri.parse('User/auth');
    final $body = dto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserAuthModel, UserAuthModel>($request);
  }

  @override
  Future<Response<UserConfirmModel>> confirm(UserConfirmDto dto) {
    final Uri $url = Uri.parse('User/confirm');
    final $body = dto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserConfirmModel, UserConfirmModel>($request);
  }

  @override
  Future<Response<List<UserModel>>> fetchUsers() {
    final Uri $url = Uri.parse('User');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<UserModel>, UserModel>($request);
  }
}
