import 'package:flutter_test/flutter_test.dart';
import 'package:nba_games/gameList/gameList.redux.dart';
import 'package:nba_games/shared/model/Game.dart';
import 'package:redux/redux.dart';

main() {
  final store = Store<GameListState>(
    gameListReducer,
    initialState: GameListState.initialState(),
  );

  final dummyGame = Game(
    'id',
    'city',
    'venue',
    'homeTeam',
    'homeTeamScore',
    'visitorTeam',
    'visitorTeamScore',
  );

  group('initial state', () {
    test('no games are loaded', () {
      expect(selectGames(store.state), []);
    });

    test('loading games flag is set to false', () {
      expect(selectIsLoadingGames(store.state), false);
    });
  });

  group('after FetchGamesAction', () {
    setUpAll(() {
      store.dispatch(FetchGamesAction());
    });

    test('loading games flag is set to true', () {
      expect(selectIsLoadingGames(store.state), true);
    });
  });

  group('after FetchGamesSucceededAction', () {
    setUpAll(() {
      store.dispatch(FetchGamesAction());
      store.dispatch(FetchGamesSucceededAction([dummyGame, dummyGame]));
    });

    test('loading games flag is set back to false', () {
      expect(selectIsLoadingGames(store.state), false);
    });

    test('games are loaded', () {
      expect(selectGames(store.state), [dummyGame, dummyGame]);
    });
  });

  group('after FetchGamesFailedAction', () {
    setUpAll(() {
      store.dispatch(FetchGamesAction());
      store.dispatch(FetchGamesFailedAction());
    });

    test('loading games flag is set back to false', () {
      expect(selectIsLoadingGames(store.state), false);
    });
  });
}
