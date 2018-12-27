import 'package:flutter_app/model/Game.dart';
import 'package:meta/meta.dart';

class AppState {
  final List<Game> games;

  AppState({@required this.games});

  @override
  String toString() => "$games";

  AppState.initialState() : games = List.unmodifiable(<Game>[]);
}
