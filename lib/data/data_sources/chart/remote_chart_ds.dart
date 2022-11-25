import 'package:chopper/chopper.dart';
import 'package:tasklet/data/data_sources/core/app_remote_ds.dart';
import 'package:tasklet/data/models/models.dart';

part 'remote_chart_ds.chopper.dart';

@ChopperApi(baseUrl: 'Charts/')
abstract class RemoteChartDataSource extends ChopperService
    implements AppRemoteDataSource {
  static RemoteChartDataSource create([ChopperClient? client]) =>
      _$RemoteChartDataSource(client);

  @Get(path: 'userstotal')
  Future<Response<TotalChartModel>> userstotal();

  @Get(path: 'total')
  Future<Response<TotalProgressChartModel>> total();

  @Get(path: 'userstabledtotal')
  Future<Response<TotalTabledChartModel>> userstabledtotal();
}
