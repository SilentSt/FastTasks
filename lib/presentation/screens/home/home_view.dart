import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/assets.gen.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/gen/locale_keys.g.dart';
import 'package:tasklet/presentation/app/app.dart';
import 'package:tasklet/presentation/navigation/app_router.dart';
import 'package:tasklet/presentation/theme/app_typography.dart';
import 'package:tasklet/presentation/widgets/app_icon_button.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';

import 'home_vm.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(
        taskService: context.user.taskService,
      ),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.home.tr()),
              automaticallyImplyLeading: false,
            ),
            body: const Center(
              child: AppLoading(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.home.tr()),
            automaticallyImplyLeading: false,
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    LocaleKeys.mainPageInfo.tr(),
                    style: AppTypography.sf.s18.w400,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (model.myTasks.isEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: LottieBuilder.asset(
                            Assets.animations.empty,
                            height: 200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            LocaleKeys.myDeskIsEmpty.tr(),
                            textAlign: TextAlign.center,
                            style: AppTypography.sf.grey.s18.w400,
                          ),
                        ),
                      ] else
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: MediaQuery.of(context).padding.bottom + 90,
                            ),
                            controller: model.scrollController,
                            children: [
                              for (final item in model.myTasks)
                                ListTile(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  onTap: () => App.router.push(TaskViewRoute(id: item.id)),
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context).size.width * .49,
                                        ),
                                        child: Text(
                                          item.title,
                                          overflow: TextOverflow.fade,
                                          style: AppTypography.sf.s24.w600.black.copyWith(
                                            color: model.colorBuilder(
                                              taskStatusfromStr(
                                                item.status.status,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (item.isExecutor)
                                        AppIconButton(
                                          onTap: () => model.addNote(
                                            context,
                                            item,
                                          ),
                                          iconWidget: const Padding(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Icon(
                                              size: 20,
                                              CupertinoIcons.pin,
                                              color: ColorName.green,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                                  minLeadingWidth: 20,
                                  leading: item.links.isNotEmpty
                                      ? SizedBox(
                                          width: 40,
                                          child: AppIconButton(
                                            onTap: () => model.downloadAll(item.links),
                                            iconWidget: Icon(
                                              Icons.file_download,
                                              color: ColorName.purple.withOpacity(0.7),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(
                                          width: 40,
                                        ),
                                  subtitle: Text(
                                    '${item.executor.userName} (${item.executor.email})',
                                    style: AppTypography.sf.s14.lightGrey,
                                  ),
                                ),
                              if (model.isLoadingMore) const AppLoading(),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
