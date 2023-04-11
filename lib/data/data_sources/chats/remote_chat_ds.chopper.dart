// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_chat_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteChatDataSource extends RemoteChatDataSource {
  _$RemoteChatDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteChatDataSource;

  @override
  Future<Response<List<ChatModel>>> fetch() {
    final Uri $url = Uri.parse('Chat');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<ChatModel>, ChatModel>($request);
  }

  @override
  Future<Response<dynamic>> add(ChatDto dto) {
    final Uri $url = Uri.parse('Chat');
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
  Future<Response<ChatModel>> getById(String chatId) {
    final Uri $url = Uri.parse('Chat/${chatId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ChatModel, ChatModel>($request);
  }

  @override
  Future<Response<dynamic>> sendMessage(MessageDto messageDto) {
    final Uri $url = Uri.parse('Chat/message');
    final $body = messageDto;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
