import 'package:flutter/material.dart';

class ChartsDetailsText extends StatelessWidget {
  const ChartsDetailsText({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 10,
          width: 10,
          child: Container(
            color: color,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
        ),
      ],
    );
  }
}
