part of 'home_page_cubit.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageError extends HomePageState {
  final String error;

  const HomePageError(this.error);

  @override
  List<Object> get props => [error];
}

final class FetchingHomeGames extends HomePageState {}

final class HomeGamesFetched extends HomePageState {
  final List<Game> todayGames;
  final List<Game> tomorrowGames;

  const HomeGamesFetched({
    required this.todayGames,
    required this.tomorrowGames,
  });

  @override
  List<Object> get props => [todayGames, tomorrowGames];
}
