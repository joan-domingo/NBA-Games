import 'package:meta/meta.dart';
import 'package:nba_games/gameList/gameList.redux.dart';
import 'package:nba_games/root.redux.dart';
import 'package:nba_games/shared/model/Game.dart';
import 'package:redux/redux.dart';

class GameListViewModel {
  final List<Game> games;
  final bool isLoadingGames;
  final Function() refreshGames;
  final RefreshGamesAction refreshGamesAction;

  GameListViewModel({
    @required this.games,
    @required this.isLoadingGames,
    @required this.refreshGames,
    @required this.refreshGamesAction,
  });

  static GameListViewModel fromStore(Store<AppState> store) {
    final gameListState = store.state.gameListState;

    final refreshGamesAction = RefreshGamesAction();
    _refreshGames() {
      store.dispatch(refreshGamesAction);
    }

    return GameListViewModel(
        games: selectGames(gameListState),
        isLoadingGames: selectIsLoadingGames(gameListState),
        refreshGames: _refreshGames,
        refreshGamesAction: refreshGamesAction);
  }
}