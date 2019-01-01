import 'dart:async';

import 'package:nba_games/NbaApi.dart';
import 'package:nba_games/root.redux.dart';
import 'package:nba_games/shared/model/Game.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

// State
class GameListState {
  final List<Game> games;
  final bool isLoadingGames;

  GameListState({this.games = const [], this.isLoadingGames = false});

  factory GameListState.initialState() => GameListState();
}

// Actions

class FetchGamesAction {
  final Completer<Null> completer;

  FetchGamesAction({Completer completer})
      : this.completer = completer ?? Completer<Null>();
}

class FetchGamesSucceededAction {
  final FetchedGamesResult fetchedGamesResult;

  FetchGamesSucceededAction(this.fetchedGamesResult);
}

class FetchGamesFailedAction {}

// Epics

class FetchGamesEpic implements EpicClass<AppState> {
  final NbaApi api;

  FetchGamesEpic(this.api);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return Observable(actions)
        .ofType(TypeToken<FetchGamesAction>())
        .asyncMap((action) => this.api.fetchGames().then((response) {
              action.completer.complete();
              return new FetchGamesSucceededAction(response);
            }).catchError(() => new FetchGamesFailedAction()));
  }
}

// Reducers

GameListState gameListReducer(GameListState state, dynamic action) {
  if (action is FetchGamesAction) {
    return _setLoadingGamesFlag(state, true);
  } else if (action is FetchGamesSucceededAction) {
    return _loadGames(state, action);
  } else if (action is FetchGamesFailedAction) {
    return _setLoadingGamesFlag(state, false);
  }
  return state;
}

GameListState _setLoadingGamesFlag(GameListState state, bool isLoading) {
  return new GameListState(games: state.games, isLoadingGames: isLoading);
}

GameListState _loadGames(
    GameListState state, FetchGamesSucceededAction action) {
  List<Game> games = action.fetchedGamesResult.games;
  return new GameListState(games: games, isLoadingGames: false);
}

// Selectors

List<Game> selectGames(AppState state) => state.gameListState.games;

bool selectIsLoadingGames(AppState state) => state.gameListState.isLoadingGames;
