import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasklet/domain/di/core/app_async_dependency_widget.dart';
import 'package:tasklet/domain/di/global_dependency.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/presentation/navigation/app_router.dart';
import 'package:tasklet/presentation/navigation/guards/auth_guard.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static AppRouter router = AppRouter(AuthGuard());
  static late Locale locale;

  @override
  Widget build(BuildContext context) {
    locale = context.locale;
    return MaterialApp.router(
      color: ColorName.white,
      debugShowCheckedModeBanner: false,
      title: 'sbeu_tasklet',

      //if you need to see pixels
      //debugShowMaterialGrid: true,

      //if you need to see device stats
      //showPerformanceOverlay: true,

      //if you need to see paddings and so on
      //showSemanticsDebugger: true,

      //localization
      supportedLocales: context.supportedLocales,
      locale: locale,
      localizationsDelegates: context.localizationDelegates,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      //theming
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: AppTypography.sf.s24.w600.white,
          shadowColor: Colors.transparent,
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: AppTypography.sf.s16.w500,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorName.purple,
                width: 2,
              ),
            ),
          ),
          labelColor: ColorName.purple,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          mouseCursor: MaterialStateProperty.all(SystemMouseCursors.click),
          unselectedLabelColor: ColorName.darkGrey,
          unselectedLabelStyle: AppTypography.sf.s16.w400,
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          primaryColor: ColorName.blue,
          primaryContrastingColor: ColorName.purple,
          brightness: Brightness.dark
        ),
        colorScheme: const ColorScheme.dark(),
      ),
      //navigation
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      //builders
      builder: (context, child) {
        return Navigator(
          pages: [
            CupertinoPage(
              child: AppAsyncDependencyWidget(
                create: GlobalDependency.new,
                dispose: (_, global) => global.dispose(),
                loadingBuilder: (context) => const AppLoading(),
                child: child ?? const SizedBox(),
              ),
            )
          ],
          onPopPage: (route, result) => false,
        );
      },
    );
  }
}
