import 'package:chopper/chopper.dart';
import 'package:tasklet/data/data_sources/core/app_remote_ds.dart';
import 'package:tasklet/data/models/models.dart';

part 'remote_auth_ds.chopper.dart';

@ChopperApi(baseUrl: 'User') 
abstract class RemoteAuthDataSource extends ChopperService
    implements AppRemoteDataSource {
  static RemoteAuthDataSource create([ChopperClient? client]) =>
      _$RemoteAuthDataSource(client);

  @Post(path: '/auth')
  Future<Response<UserAuthModel>> auth(@Body() final UserAuthDto dto);

  @Post(path: '/confirm')
  Future<Response<UserConfirmModel>> confirm(@Body() final UserConfirmDto dto);

  @Get()
  Future<Response<List<UserModel>>> fetchUsers();
}
