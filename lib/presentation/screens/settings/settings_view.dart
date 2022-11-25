import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/domain/di/global_dependency.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_button.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'settings_vm.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(
        authService: context.global.authService,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return const Scaffold(
            body: Center(
              child: AppLoading(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.settings.tr(),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    if (!kIsWeb)
                      ListTile(
                        leading: const Icon(
                          CupertinoIcons.bell,
                          color: ColorName.black,
                          size: 30,
                        ),
                        title: Text(
                          LocaleKeys.notifications.tr(),
                          style: AppTypography.sf.s18.w500.black,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            LocaleKeys.notificationsInfo.tr(),
                            style: AppTypography.sf.s14.w400.black,
                          ),
                        ),
                        trailing: CupertinoSwitch(
                          value: model.notificationsEnabled,
                          onChanged: model.onNotificationsValueChanged,
                          activeColor: ColorName.red.withOpacity(0.7),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.language,
                            size: 30,
                            color: ColorName.black,
                          ),
                          const SizedBox(width: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 250,
                                child: DropdownButtonFormField<Locale>(
                                  hint: Text(
                                    LocaleKeys.language.tr(),
                                    style: AppTypography.sf.s16.w500.black,
                                  ),
                                  elevation: 1,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  dropdownColor: ColorName.white,
                                  borderRadius: BorderRadius.circular(12),
                                  style: AppTypography.sf.s18.w500.black,
                                  value: context.locale,
                                  items: context.supportedLocales.map((e) {
                                    String res = e.toLanguageTag();
                                    switch (res) {
                                      case 'en':
                                        res = 'English';
                                        break;
                                      case 'ru':
                                        res = 'Русский';
                                        break;
                                    }
                                    return DropdownMenuItem<Locale>(
                                      value: e,
                                      child: Text(
                                        res,
                                        style: AppTypography.sf.s18.w500.black,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (locale) => model.onLanguageChanged(locale, context),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  LocaleKeys.languageInfo.tr(),
                                  style: AppTypography.sf.s14.w400.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 110,
                ),
                child: Center(
                  child: SizedBox(
                    width: 250,
                    child: AppButton(
                      onTap: model.onLogout,
                      buttonColor: ColorName.purple,
                      text: LocaleKeys.logout.tr(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
