import 'package:nba_games/NbaApi.dart';

class FetchGamesAction {}

class FetchGamesSucceededAction {
  final FetchedGamesResult fetchedGamesResult;

  FetchGamesSucceededAction(this.fetchedGamesResult);
}

class FetchGamesFailedAction {}
