import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasklet/gen/colors.gen.dart';

class ChatsShimmer extends StatefulWidget {
  const ChatsShimmer({Key? key}) : super(key: key);

  @override
  _ChatsShimmerState createState() => _ChatsShimmerState();
}

class _ChatsShimmerState extends State<ChatsShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorName.lightGrey,
      highlightColor: ColorName.white,
      child: ListView.separated(
        itemBuilder: (_, __) => SizedBox(
          height: 90,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorName.lightGrey,
            ),
          ),
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
