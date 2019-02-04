import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nba_games/AppRoutes.dart';
import 'package:nba_games/configureStore.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  cameras = await availableCameras();
  runApp(NbaGamesApp());
}

class NbaGamesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: appStore,
      child: new MaterialApp(
        title: 'NBA games',
        initialRoute: AppRoutes.initialRoute(),
        routes: AppRoutes.getRoutes(context),
      ),
    );
  }
}
