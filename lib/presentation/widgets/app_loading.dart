import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tasklet/gen/assets.gen.dart';

enum LoadingVariants {
  v1,
  v2,
}

class AppLoading extends StatelessWidget {
  const AppLoading({
    Key? key,
    this.selected = LoadingVariants.v1,
  }) : super(key: key);

  final LoadingVariants selected;
  @override
  Widget build(BuildContext context) {
    switch (selected) {
      case LoadingVariants.v1:
        return LottieBuilder.asset(
          Assets.animations.loading1,
          width: 50,
          height: 50,
        );
      case LoadingVariants.v2:
        return LottieBuilder.asset(
          Assets.animations.loading2,
          width: 50,
          height: 50,
        );
    }
  }
}
