import 'package:nba_games/model/Game.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<Game> games;
  final bool isLoadingGames;

  AppState({this.games = const [], this.isLoadingGames = false});

  factory AppState.loading() => AppState(isLoadingGames: true);

  @override
  String toString() {
    return 'AppState{games: $games, isLoadingGames: $isLoadingGames}';
  }
}
