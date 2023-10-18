import 'package:flutter/material.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';

class GameDetailItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  const GameDetailItem({required this.iconData, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: context.colorScheme.primary,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: context.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
