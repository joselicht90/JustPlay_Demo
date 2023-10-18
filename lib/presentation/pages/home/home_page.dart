import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_play_demo/data/models/city.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';
import 'package:just_play_demo/injectable.dart';
import 'package:just_play_demo/presentation/pages/home/cubit/home_page_cubit.dart';
import 'package:just_play_demo/presentation/pages/home/home_games_list.dart';
import 'package:just_play_demo/presentation/pages/home/home_searching.dart';

class HomePage extends StatelessWidget {
  final City? city;
  const HomePage({required this.city, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomePageCubit>(param1: city),
      child: const HomePageConsumer(),
    );
  }
}

class HomePageConsumer extends StatefulWidget {
  const HomePageConsumer({super.key});

  @override
  State<HomePageConsumer> createState() => _HomePageConsumerState();
}

class _HomePageConsumerState extends State<HomePageConsumer> {
  @override
  void initState() {
    context.read<HomePageCubit>().fetchGames();
    super.initState();
  }

  Widget _getSwitcherChild(HomePageState state) {
    if (state is HomeGamesFetched) {
      return HomeGameList(
        todayGames: state.todayGames,
        tomorrowGames: state.tomorrowGames,
      );
    }
    if (state is FetchingHomeGames) {
      return const HomeSearchingScreen();
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {
        if (state is HomePageError) {
          context.showError(error: state.error);
        }
      },
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _getSwitcherChild(state),
        );
      },
    );
  }
}
