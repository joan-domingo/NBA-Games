import 'package:meta/meta.dart';
import 'package:nba_games/root.redux.dart';
import 'package:nba_games/shared/model/Game.dart';
import 'package:redux/redux.dart';

class GameDetailsViewModel {
  final Game game;

  GameDetailsViewModel({@required this.game});

  static GameDetailsViewModel fromStore(Store<AppState> store, String gameId) {
    final gameListState = store.state.gameListState;
    return GameDetailsViewModel(
        game: gameListState.games.firstWhere((g) => g.id == gameId));
  }
}