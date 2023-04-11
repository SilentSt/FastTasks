import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tasklet/data/converters/json_mappable_converter.dart';
import 'package:tasklet/data/data_sources/auth/remote_auth_ds.dart';
import 'package:tasklet/data/data_sources/upload/mobile_upload_ds.dart';
import 'package:tasklet/data/data_sources/upload/web_upload_ds.dart';
import 'package:tasklet/data/interceptors/auth_interceptor.dart';
import 'package:tasklet/domain/di/core/app_async_dependency.dart';
import 'package:tasklet/domain/di/preload_dependency.dart';
import 'package:tasklet/domain/services/auth_service.dart';
import 'package:tasklet/domain/services/error_service.dart';
import 'package:tasklet/domain/services/upload_service.dart';

class GlobalDependency extends AppAsyncDependency {
  GlobalDependency(super.context);

  @override
  Future<void> init(BuildContext context) async {
    final authRds = RemoteAuthDataSource.create(_chopper);
    final uploadWds = WebUploadDataSource();
    final uploadMds = MobileUploadDataSource();

    _errorService = ErrorService(context);
    _authService = AuthService(
      context.read<PreloadDependency>().authLds,
      authRds,
      _errorService,
    );

    _uploadService = UploadService(uploadWds, uploadMds, _errorService);
    _authService.init(context);
  }

  final ChopperClient _chopper = ChopperClient(
    baseUrl: Uri.parse('https://sbeusilent.space/'),
    converter: JsonMappableConverter(),
    errorConverter: JsonMappableConverter(),
    interceptors: [
      const AuthInterceptor(),
    ],
  );

  late final AuthService _authService;
  late final ErrorService _errorService;
  late final UploadService _uploadService;

  AuthService get authService => _authService;
  ErrorService get errorService => _errorService;
  UploadService get uploadService => _uploadService;
  ChopperClient get chopper => _chopper;

  @override
  void dispose() {
    _authService.dispose();
  }
}

extension GlobalReader on BuildContext {
  GlobalDependency get global => read<GlobalDependency>();
}
