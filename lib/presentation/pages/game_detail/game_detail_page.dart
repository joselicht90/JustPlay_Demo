import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_play_demo/data/models/game.dart';
import 'package:just_play_demo/presentation/pages/game_detail/widgets/game_detail_body.dart';
import 'package:just_play_demo/presentation/shared/buttons/jp_back_button.dart';

class GameDetailPage extends StatelessWidget {
  final Game game;
  const GameDetailPage({required this.game, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: JPBackButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: GameDetailBody(game: game)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  child: const Text('Join Game!'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
