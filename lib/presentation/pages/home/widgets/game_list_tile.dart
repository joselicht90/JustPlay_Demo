import 'package:flutter/material.dart';
import 'package:just_play_demo/data/models/game.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/extensions/date_extensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GameListTile extends StatelessWidget {
  final Game game;
  const GameListTile({
    required this.game,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.asset(
              game.image!,
              fit: BoxFit.cover,
              width: 15.w,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(game.locationDescription),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 15.w,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.people,
                        size: 15,
                      ),
                      Text(
                        '${game.joinedPlayers}/${game.maxPlayers}',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 15,
                      ),
                      Text(
                        game.startTime.formatHourMinutes(),
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
