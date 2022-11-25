import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasklet/gen/colors.gen.dart';

class ChatTitleShimmer extends StatelessWidget {
  const ChatTitleShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorName.lightGrey,
      highlightColor: ColorName.white,
      child: SizedBox(
        width: 150,
        height: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorName.lightGrey,
          ),
        ),
      ),
    );
  }
}
