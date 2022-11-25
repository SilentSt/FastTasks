import 'package:chopper/chopper.dart';
import 'package:tasklet/data/data_sources/core/app_remote_ds.dart';
import 'package:tasklet/data/models/models.dart';

part 'remote_push_ds.chopper.dart';

@ChopperApi(baseUrl: 'User/') 
abstract class RemotePushDataSource extends ChopperService
    implements AppRemoteDataSource {
  static RemotePushDataSource create([ChopperClient? client]) =>
      _$RemotePushDataSource(client);

  @Post(path: 'hookPush')
  Future<Response> setToken(@Body() final PushTokenDto dto);
}
