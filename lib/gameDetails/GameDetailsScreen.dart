import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nba_games/gameDetails/GameDetailsViewModel.dart';
import 'package:nba_games/gameDetails/GameDetailsWidget.dart';
import 'package:nba_games/root.redux.dart';

class GameDetailsScreen extends StatelessWidget {
  final String gameId;

  GameDetailsScreen({@required this.gameId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Game Details"),
        ),
        body: StoreConnector<AppState, GameDetailsViewModel>(
          converter: (store) => GameDetailsViewModel.fromStore(store, gameId),
          builder: (context, vm) => GameDetailsWidget(vm: vm),
        ));
  }
}
