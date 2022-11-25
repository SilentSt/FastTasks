import 'package:chopper/chopper.dart';
import 'package:tasklet/data/data_sources/core/app_remote_ds.dart';
import 'package:tasklet/data/models/models.dart';

part 'remote_table_ds.chopper.dart';

@ChopperApi(baseUrl: 'Table')
abstract class RemoteTableDataSource extends ChopperService
    implements AppRemoteDataSource {
  static RemoteTableDataSource create([ChopperClient? client]) =>
      _$RemoteTableDataSource(client);

  @Get()
  Future<Response<List<TableModel>>> fetch();

  @Post()
  Future<Response<dynamic>> add(@Body() final TableDto dto);

  @Patch()
  Future<Response<dynamic>> edit(@Body() final TableDto dto);
}
