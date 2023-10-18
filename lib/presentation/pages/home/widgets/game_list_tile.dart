import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:just_play_demo/data/models/game.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/extensions/date_extensions.dart';
import 'package:just_play_demo/presentation/pages/game_detail/game_detail_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GameListTile extends StatelessWidget {
  final Game game;
  const GameListTile({
    required this.game,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainerWrapper(
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (BuildContext context, VoidCallback _) {
        return GameDetailPage(game: game);
      },
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return SmallCard(
          openContainer: openContainer,
          game: game,
        );
      },
      onClosed: (_) {},
    );
  }
}

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    required this.closedBuilder,
    required this.transitionType,
    required this.onClosed,
    required this.openBuilder,
    super.key,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;
  final Widget Function(BuildContext context, VoidCallback action) openBuilder;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: openBuilder,
      onClosed: onClosed,
      tappable: false,
      closedElevation: 0,
      closedBuilder: closedBuilder,
    );
  }
}

class SmallCard extends StatelessWidget {
  final Game game;
  final VoidCallback openContainer;
  const SmallCard({required this.game, required this.openContainer, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: openContainer,
      child: Container(
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
              child: SizedBox(
                height: 7.h,
                child: Image.asset(
                  game.image!,
                  fit: BoxFit.fill,
                  width: 15.w,
                ),
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
      ),
    );
  }
}
