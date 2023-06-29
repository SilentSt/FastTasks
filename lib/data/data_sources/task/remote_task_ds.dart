import 'package:chopper/chopper.dart';
import 'package:tasklet/data/data_sources/core/app_remote_ds.dart';
import 'package:tasklet/data/models/models.dart';

part 'remote_task_ds.chopper.dart';

@ChopperApi(baseUrl: 'Task')
abstract class RemoteTaskDataSource extends ChopperService implements AppRemoteDataSource {
  static RemoteTaskDataSource create([ChopperClient? client]) => _$RemoteTaskDataSource(client);

  @Get()
  Future<Response<List<TaskModel>>> fetch(
    @Query('skip') int skip,
    @Query('take') int take,
  );

  @Get(path: r'/table/{tableId}')
  Future<Response<List<TaskModel>>> getByTableId(
    @Path() final String tableId,
    @Query('skip') int skip,
    @Query('take') int take,
  );

  @Get(path: r'/{id}')
  Future<Response<TaskModel>> getTaskById(
    @Path() final String id,
  );

  @Post()
  Future<Response<dynamic>> add(@Body() final TaskDto dto);

  @Post(path: r'/note')
  Future<Response<dynamic>> addNote(@Body() final NoteDto dto);

  @Patch()
  Future<Response<dynamic>> edit(@Body() final TaskDto dto);

  @Patch()
  Future<Response<dynamic>> updateStatus(@Body() final StatusModel dto);
}
