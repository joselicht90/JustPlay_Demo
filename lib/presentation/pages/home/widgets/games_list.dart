import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:just_play_demo/data/models/game.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/presentation/pages/home/widgets/game_list_tile.dart';

class GamesList extends StatelessWidget {
  final String title;
  final List<Game> games;
  const GamesList({required this.title, required this.games, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: context.textTheme.titleMedium,
          ),
        ),
        AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: games.map((g) => GameListTile(game: g)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
