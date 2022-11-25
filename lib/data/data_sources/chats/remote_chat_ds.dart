import 'package:chopper/chopper.dart';
import 'package:tasklet/data/data_sources/core/app_remote_ds.dart';
import 'package:tasklet/data/models/models.dart';

part 'remote_chat_ds.chopper.dart';

@ChopperApi(baseUrl: 'Chat')
abstract class RemoteChatDataSource extends ChopperService
    implements AppRemoteDataSource {
  static RemoteChatDataSource create([ChopperClient? client]) =>
      _$RemoteChatDataSource(client);

  @Get()
  Future<Response<List<ChatModel>>> fetch();

  @Post()
  Future<Response<dynamic>> add(@Body() final ChatDto dto);

  @Get(path: r'/{chatId}')
  Future<Response<ChatModel?>> getById(@Path() final String chatId);

  @Post(path: r'/message')
  Future<Response<dynamic>> sendMessage(@Body() final MessageDto messageDto);
}
