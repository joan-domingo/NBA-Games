import 'package:nba_games/gameList/gameList.redux.dart';
import 'package:nba_games/root.redux.dart';
import 'package:redux/redux.dart';

final appStore = new Store<AppState>(
  appReducer,
  initialState: AppState.initialState(),
  middleware: configureMiddleware(),
);

List<Middleware<AppState>> configureMiddleware() {
  return []..addAll(gameListEpics);
}
