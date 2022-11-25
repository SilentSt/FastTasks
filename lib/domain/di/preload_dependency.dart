import 'package:flutter/src/widgets/framework.dart';
import 'package:tasklet/data/data_sources/auth/local_auth_ds.dart';
import 'package:tasklet/domain/di/core/app_async_dependency.dart';

class PreloadDependency extends AppAsyncDependency {
  PreloadDependency(super.context);

  late final LocalAuthDataSource _authLds;

  LocalAuthDataSource get authLds => _authLds;

  @override
  Future<void> init(BuildContext context) async {
    _authLds = LocalAuthDataSource();
    await _authLds.readToken();
  }

  @override
  void dispose() {}
}
