import 'package:nba_games/AppState.dart';
import 'package:nba_games/model/Game.dart';

List<Game> selectGames(AppState state) => state.games;

bool selectIsLoadingGames(AppState state) => state.isLoadingGames;
