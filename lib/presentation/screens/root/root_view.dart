import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/domain/di/core/app_async_dependency_widget.dart';
import 'package:tasklet/domain/di/user_dependency.dart';
import 'package:tasklet/gen/colors.gen.dart';
import 'package:tasklet/presentation/screens/root/providers/hide_provider.dart';
import 'package:tasklet/presentation/widgets/app_icon_button.dart';
import 'package:tasklet/presentation/widgets/app_loading.dart';

import 'root_vm.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppAsyncDependencyWidget(
      loadingBuilder: (context) => const AppLoading(),      
      create: UserDependency.new,
      dispose: (context, value) => value.dispose(),
      child: ViewModelBuilder<RootViewModel>.reactive(
        viewModelBuilder: () => RootViewModel(),
        onModelReady: (model) => model.onReady(),
        builder: (context, model, child) {
          return Provider(
            create: (context) => HideProvider(
              hide: model.hideNavbar,
              show: model.showNavbar,
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (model.navbarVisible &&
                          MediaQuery.of(context).orientation ==
                              Orientation.landscape)
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).padding.left + 10,
                            top: MediaQuery.of(context).padding.top + 10,
                            bottom: 10,
                            right: 10,
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 80,
                              minWidth: 80,
                              maxHeight: 500,
                            ),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: ColorName.black.withOpacity(1),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 36),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                    model.icons.length,
                                    (index) => AppIconButton(
                                      iconWidget: Icon(
                                        model.icons[index],
                                        color: model.selectedPage == index
                                            ? ColorName.purple.withOpacity(0.9)
                                            : ColorName.white,
                                        size: 32,
                                      ),
                                      onTap: () => model.animateToPage(index),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      const Expanded(child: AutoRouter()),
                    ],
                  ),
                  if (model.navbarVisible &&
                      MediaQuery.of(context).orientation ==
                          Orientation.portrait)
                    Positioned(
                      bottom: MediaQuery.of(context).padding.bottom + 15,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width > 700
                                ? 700
                                : MediaQuery.of(context).size.width - 30,
                            maxHeight: 50,
                            minHeight: 50,
                          ),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: ColorName.black,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 36),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  model.icons.length,
                                  (index) => AppIconButton(
                                    iconWidget: Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Icon(
                                        model.icons[index],
                                        color: model.selectedPage == index
                                            ? ColorName.purple.withOpacity(0.9)
                                            : ColorName.white,
                                        size: 32,
                                      ),
                                    ),
                                    onTap: () => model.animateToPage(index),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
