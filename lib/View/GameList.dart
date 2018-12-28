import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nba_games/AppState.dart';
import 'package:nba_games/View/GameListWidget.dart';
import 'package:nba_games/model/Game.dart';
import 'package:nba_games/redux/selectors.dart';
import 'package:redux/redux.dart';

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
        );
      },
    );
  }
}

class _ViewModel {
  final List<Game> games;
  final bool isLoadingGames;

  _ViewModel({@required this.games, @required this.isLoadingGames});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      games: selectGames(store.state),
      isLoadingGames: selectIsLoadingGames(store.state),
    );
  }
}
