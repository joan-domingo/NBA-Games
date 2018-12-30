import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nba_games/AppState.dart';
import 'package:nba_games/View/GameListWidget.dart';
import 'package:nba_games/model/Game.dart';
import 'package:nba_games/redux/actions.dart';
import 'package:nba_games/redux/selectors.dart';
import 'package:redux/redux.dart';

class GameListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Games'),
        ),
        body: GameList());
  }
}

class GameList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return GameListWidget(
            games: vm.games,
            isLoadingGames: vm.isLoadingGames,
            refreshGames: vm.refreshGames,
            fetchGamesAction: vm.fetchGamesAction);
      },
      onInit: (store) {
        store.dispatch(FetchGamesAction());
      },
    );
  }
}

class _ViewModel {
  final List<Game> games;
  final bool isLoadingGames;
  final Function() refreshGames;
  final FetchGamesAction fetchGamesAction;

  _ViewModel({
    @required this.games,
    @required this.isLoadingGames,
    @required this.refreshGames,
    @required this.fetchGamesAction,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    final fetchGamesAction = FetchGamesAction();
    _refreshGames() {
      store.dispatch(fetchGamesAction);
    }

    return _ViewModel(
        games: selectGames(store.state),
        isLoadingGames: selectIsLoadingGames(store.state),
        refreshGames: _refreshGames,
        fetchGamesAction: fetchGamesAction);
  }
}
