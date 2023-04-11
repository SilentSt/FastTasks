// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_chart_ds.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteChartDataSource extends RemoteChartDataSource {
  _$RemoteChartDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteChartDataSource;

  @override
  Future<Response<TotalChartModel>> userstotal() {
    final Uri $url = Uri.parse('Charts/userstotal');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TotalChartModel, TotalChartModel>($request);
  }

  @override
  Future<Response<TotalProgressChartModel>> total() {
    final Uri $url = Uri.parse('Charts/total');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<TotalProgressChartModel, TotalProgressChartModel>($request);
  }

  @override
  Future<Response<TotalTabledChartModel>> userstabledtotal() {
    final Uri $url = Uri.parse('Charts/userstabledtotal');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TotalTabledChartModel, TotalTabledChartModel>($request);
  }

  @override
  Future<Response<List<ChartTimeduserstotalModel>>> timeduserstotal() {
    final Uri $url = Uri.parse('Charts/timeduserstotal');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<ChartTimeduserstotalModel>,
        ChartTimeduserstotalModel>($request);
  }
}
