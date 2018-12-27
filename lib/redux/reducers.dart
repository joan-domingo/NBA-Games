import 'package:flutter_app/model/AppState.dart';
import 'package:flutter_app/model/Game.dart';
import 'package:flutter_app/redux/actions.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is FetchGamesSucceededAction) {
    return loadGames(state.games, action);
  }
  return state;
}

AppState loadGames(List<Game> games, FetchGamesSucceededAction action) {
  return new AppState(games: action.fetchedGamesResult.games);
}
