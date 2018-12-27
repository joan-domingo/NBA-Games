import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/NbaApi.dart';
import 'package:flutter_app/View/HomePage.dart';
import 'package:flutter_app/model/AppState.dart';
import 'package:flutter_app/redux/actions.dart';
import 'package:flutter_app/redux/epics.dart';
import 'package:flutter_app/redux/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

class NbaGamesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = new Store<AppState>(appStateReducers,
        initialState: AppState.initialState(),
        middleware: [
//        SearchMiddleware(GithubApi()),
          EpicMiddleware<AppState>(FetchGamesEpic(NbaApi())),
        ]);

    return StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
          title: 'NBA games',
          home: new StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(new FetchGamesAction()),
              builder: (context, store) => new HomePage())),
    );
  }
}
