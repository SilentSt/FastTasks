import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasklet/domain/di/core/app_async_dependency_widget.dart';
import 'package:tasklet/domain/di/preload_dependency.dart';
import 'package:tasklet/firebase_options.dart';

import 'gen/codegen_loader.g.dart';
import 'presentation/app/app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    AppAsyncDependencyWidget<PreloadDependency>(
      create: PreloadDependency.new,
      dispose: (_, dep) => dep.dispose(),
      loadingBuilder: (_) => const SizedBox(),
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
        ],
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        path: 'assets/translations',
        useOnlyLangCode: true,
        assetLoader: const CodegenLoader(),
        child: const App(),
      ),
    ),
  );
}
