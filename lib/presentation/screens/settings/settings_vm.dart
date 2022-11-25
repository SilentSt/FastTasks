import 'package:permission_handler/permission_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/domain/services/auth_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SettingsViewModel extends BaseViewModel {
  SettingsViewModel({
    required this.authService,
  });
  bool notificationsEnabled = false;

  final AuthService authService;

  Future<void> onReady() async {
    if (!kIsWeb) {
      notificationsEnabled = await Permission.notification.isGranted;
    }
    notifyListeners();
  }

  Future<void> onNotificationsValueChanged(bool value) async {
    if (await Permission.notification.isPermanentlyDenied || await Permission.notification.isDenied) {
      await openAppSettings();
      notificationsEnabled = await Permission.notification.isGranted;

      notifyListeners();
      return;
    } //
    if (value) {
      notificationsEnabled = await Permission.notification.request().isGranted;
    } else {
      await openAppSettings();
      notificationsEnabled = await Permission.notification.isGranted;
    }
    notifyListeners();
  }

  void onLanguageChanged(Locale? locale, BuildContext context) {
    if (locale == null) return;
    context.setLocale(locale);
    notifyListeners();
  }

  Future<void> onLogout() async {
    await authService.logout();
  }
}
