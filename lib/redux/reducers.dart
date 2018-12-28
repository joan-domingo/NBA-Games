import 'package:nba_games/AppState.dart';
import 'package:nba_games/model/Game.dart';
import 'package:nba_games/redux/actions.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is FetchGamesAction) {
    setLoadingGamesFlag(state, true);
  } else if (action is FetchGamesSucceededAction) {
    return loadGames(state, action);
  } else if (action is FetchGamesFailedAction) {
    return setLoadingGamesFlag(state, false);
  }
  return state;
}

AppState setLoadingGamesFlag(AppState state, bool isLoading) {
  return new AppState(games: state.games, isLoadingGames: isLoading);
}

AppState loadGames(AppState state, FetchGamesSucceededAction action) {
  List<Game> games = action.fetchedGamesResult.games;
  return new AppState(games: games, isLoadingGames: false);
}
