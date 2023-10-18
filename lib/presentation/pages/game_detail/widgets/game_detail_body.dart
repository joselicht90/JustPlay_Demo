import 'package:flutter/material.dart';
import 'package:just_play_demo/data/models/game.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/extensions/date_extensions.dart';
import 'package:just_play_demo/extensions/number_extensions.dart';
import 'package:just_play_demo/presentation/pages/game_detail/widgets/game_detail_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GameDetailBody extends StatelessWidget {
  final Game game;
  const GameDetailBody({required this.game, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          game.image!,
          height: 30.h,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game.locationDescription,
                style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                game.description!,
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              GameDetailItem(
                iconData: Icons.calendar_month,
                text: game.startTime.formatMMMddHHmm(),
              ),
              const SizedBox(
                height: 20,
              ),
              GameDetailItem(
                iconData: Icons.people_alt_sharp,
                text: '${game.joinedPlayers}/${game.maxPlayers}',
              ),
              const SizedBox(
                height: 20,
              ),
              GameDetailItem(
                iconData: Icons.attach_money_rounded,
                text: game.price.toCurrency(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
