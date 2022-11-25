import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasklet/gen/colors.gen.dart';

class ChatMessagesShimmer extends StatelessWidget {
  const ChatMessagesShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorName.lightGrey,
      highlightColor: ColorName.white,
      child: ListView.separated(
        itemBuilder: (_, __) => Align(
          alignment: Random().nextBool()
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: SizedBox(
            height: Random().nextDouble() * 90 + 30,
            width: MediaQuery.of(context).size.width -
                Random().nextDouble() * 200 -
                106,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorName.lightGrey,
              ),
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
