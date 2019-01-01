import 'package:nba_games/gameList/gameList.redux.dart';

// State

class AppState {
  final GameListState gameListState;

  AppState({
    this.gameListState,
  });

  factory AppState.initialState() {
    return AppState(
      gameListState: GameListState.initialState(),
    );
  }
}

// Reducer

AppState appReducer(AppState state, action) => new AppState(
      gameListState: gameListReducer(state.gameListState, action),
    );
