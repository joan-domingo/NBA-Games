import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nba_games/gameDetails/GameDetailsWidget.dart';
import 'package:nba_games/root.redux.dart';
import 'package:nba_games/shared/model/Game.dart';
import 'package:redux/redux.dart';

class GameDetailsScreen extends StatelessWidget {
  final String gameId;

  GameDetailsScreen({@required this.gameId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Game Details"),
        ),
        body: StoreConnector<AppState, _ViewModel>(
          converter: (store) => _ViewModel.fromStore(store, gameId),
          builder: (context, vm) => GameDetailsWidget(game: vm.game),
        ));
  }
}

class _ViewModel {
  final Game game;

  _ViewModel({@required this.game});

  static _ViewModel fromStore(Store<AppState> store, String gameId) {
    final gameListState = store.state.gameListState;
    return _ViewModel(
        game: gameListState.games.firstWhere((g) => g.id == gameId));
  }
}
