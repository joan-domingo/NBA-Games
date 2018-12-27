import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/AppState.dart';
import 'package:flutter_app/model/Game.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Games List'),
        ),
        body: StoreConnector<AppState, GameListViewModel>(
            converter: (store) => GameListViewModel(state: store.state),
            builder: (context, GameListViewModel viewModel) => Column(
                  children: <Widget>[
                    Expanded(child: ItemListWidget(viewModel))
                  ],
                )));
  }
}

class ItemListWidget extends StatelessWidget {
  final GameListViewModel viewModel;

  ItemListWidget(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: viewModel.state.games
            .map((Game game) =>
                ListTile(title: Text("${game.vTeam}-${game.hTeam}")))
            .toList());
  }
}

class GameListViewModel {
  final AppState state;

  GameListViewModel({this.state});
}
