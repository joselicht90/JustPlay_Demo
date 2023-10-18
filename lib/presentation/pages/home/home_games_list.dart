// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:just_play_demo/data/models/game.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/presentation/pages/home/widgets/games_list.dart';
import 'package:just_play_demo/presentation/shared/buttons/jp_logout_button.dart';

class HomeGameList extends StatelessWidget {
  final List<Game> todayGames;
  final List<Game> tomorrowGames;
  const HomeGameList({
    required this.todayGames,
    required this.tomorrowGames,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(
            'assets/icons/app_icon.png',
            height: kToolbarHeight - 20,
          ),
        ),
        actions: const [JPLogoutButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Here are some games for you',
                  style: context.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GamesList(title: 'Today Games', games: todayGames),
              const SizedBox(
                height: 20,
              ),
              GamesList(title: 'Tomorrow Games', games: tomorrowGames),
            ],
          ),
        ),
      ),
    );
  }
}
