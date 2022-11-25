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
            ),
            body: const Center(
              child: AppLoading(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.home.tr()),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.mainPageInfo.tr(),
                    style: AppTypography.sf.s18.w400,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.myTasks.isEmpty) ...[
                          LottieBuilder.asset(
                            Assets.animations.empty,
                            height: 200,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            LocaleKeys.myDeskIsEmpty.tr(),
                            textAlign: TextAlign.center,
                            style: AppTypography.sf.grey.s18.w400,
                          ),
                        ] else
                          Expanded(
                            child: ListView(
                              children: [
                                ExpansionPanelList(
                                  expansionCallback: (panelIndex, isExpanded) =>
                                      model.updateExp(
                                    panelIndex,
                                  ),
                                  elevation: 0,
                                  children: [
                                    for (final item in model.myTasks)
                                      ExpansionPanel(
                                        isExpanded: model.expansions[
                                            model.myTasks.indexOf(item)],
                                        backgroundColor: Colors.transparent,
                                        headerBuilder: (context, isExpanded) {
                                          return ListTile(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .49,
                                                  ),
                                                  child: Text(
                                                    item.title,
                                                    overflow: TextOverflow.fade,
                                                    style: AppTypography
                                                        .sf.s24.w600.black
                                                        .copyWith(
                                                      color: model.colorBuilder(
                                                        taskStatusfromInt(
                                                          item.status,
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
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5),
                                            minLeadingWidth: 20,
                                            leading: item.links.isNotEmpty
                                                ? SizedBox(
                                                    width: 40,
                                                    child: AppIconButton(
                                                      onTap: () =>
                                                          model.downloadAll(
                                                              item.links),
                                                      iconWidget: Icon(
                                                        Icons.file_download,
                                                        color: ColorName.red
                                                            .withOpacity(0.7),
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(
                                                    width: 40,
                                                  ),
                                            subtitle: Text(
                                              '${item.executor.userName} (${item.executor.email})',
                                              style: AppTypography.sf.s14.black,
                                            ),
                                          );
                                        },
                                        body: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 36),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                LocaleKeys.description.tr(),
                                                style: AppTypography.sf.s18,
                                              ),
                                              const SizedBox(height: 5),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Text(
                                                  item.description,
                                                  style: AppTypography
                                                      .sf.s14.black,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Text(
                                                LocaleKeys.files.tr(),
                                                style: AppTypography.sf.s18,
                                              ),
                                              const SizedBox(height: 5),
                                              for (final link in item.links)
                                                ListTile(
                                                  leading: AppIconButton(
                                                    onTap: () =>
                                                        model.downloadOne(link),
                                                    iconWidget: const Icon(
                                                      Icons.file_download,
                                                      color: ColorName.purple,
                                                    ),
                                                  ),
                                                  title: Text(
                                                    link,
                                                    style: AppTypography.sf.s12,
                                                  ),
                                                ),
                                              const SizedBox(height: 20),
                                              if (item.note != null &&
                                                  item.note!.isNotEmpty) ...[
                                                Text(
                                                  LocaleKeys.note.tr(),
                                                  style: AppTypography.sf.s18,
                                                ),
                                                const SizedBox(height: 5),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 30),
                                                  child: Text(
                                                    item.note!,
                                                    style: AppTypography.sf.s14,
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                              ],
                                              Text(
                                                LocaleKeys.status.tr(),
                                                style: AppTypography.sf.s18,
                                              ),
                                              const SizedBox(height: 5),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: Row(
                                                  children: [
                                                    if (item.status != 0)
                                                      AppIconButton(
                                                        onTap: () => model
                                                            .updateTaskStatus(
                                                          item.status - 1,
                                                          item.id,
                                                        ),
                                                        iconWidget: const Icon(
                                                          Icons.arrow_back_ios,
                                                          color:
                                                              ColorName.green,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    Text(
                                                      taskStatusfromInt(
                                                        item.status,
                                                      ).title,
                                                      style:
                                                          AppTypography.sf.s14,
                                                    ),
                                                    if (item.status != 3)
                                                      AppIconButton(
                                                        onTap: () => model
                                                            .updateTaskStatus(
                                                          item.status + 1,
                                                          item.id,
                                                        ),
                                                        iconWidget: const Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color:
                                                              ColorName.green,
                                                          size: 30,
                                                        ),
                                                      )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 90),
                      ],
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
