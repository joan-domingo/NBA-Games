import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nba_games/gameList/GameListViewModel.dart';
import 'package:nba_games/gameList/GameListWidget.dart';
import 'package:nba_games/gameList/gameList.redux.dart';
import 'package:nba_games/root.redux.dart';

class GameListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Games'),
      ),
      body: StoreConnector<AppState, GameListViewModel>(
        // distinct: true,
        converter: GameListViewModel.fromStore,
        builder: (context, vm) {
          return GameListWidget(vm: vm);
        },
        onInit: (store) {
          store.dispatch(FetchGamesAction());
        },
      ),
    );
  }
}
