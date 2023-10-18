import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:just_play_demo/data/models/city.dart';
import 'package:just_play_demo/data/models/game.dart';
import 'package:just_play_demo/data/repositories/games_repository.dart';
import 'package:just_play_demo/extensions/date_extensions.dart';

part 'home_page_state.dart';

//Simple cubit for managing the UI state of the home page
@injectable
class HomePageCubit extends Cubit<HomePageState> {
  final GamesRepository _gamesRepository;
  final City? city;

  List<Game> games = [];

  HomePageCubit(
    this._gamesRepository,
    @factoryParam this.city,
  ) : super(HomePageInitial());

  Future<void> fetchGames() async {
    emit(FetchingHomeGames());
    try {
      //We split the games into what we need for the UI
      final games = await _gamesRepository.getGames();
      final todayGames = games.where((g) => g.startTime.isToday()).toList();
      final tomorrowGames =
          games.where((g) => g.startTime.isTomorrow()).toList();

      //Just a delayed for animation
      await Future.delayed(const Duration(seconds: 5));

      emit(HomeGamesFetched(
        todayGames: todayGames,
        tomorrowGames: tomorrowGames,
      ));
    } catch (e) {
      emit(HomePageError(e.toString()));
    }
  }
}
