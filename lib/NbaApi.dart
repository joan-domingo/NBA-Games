import 'dart:convert';

import 'package:nba_games/shared/model/Game.dart';
import 'package:nba_games/shared/model/Month.dart';
import 'package:http/http.dart' as http;

class NbaApi {
  final String baseUrl =
      'http://data.nba.com/data/10s/v2015/json/mobile_teams/nba/2018/league/00_full_schedule.json';

  Future<FetchedGamesResult> fetchGames() async {
    final response = await http.get(baseUrl);
    return new FetchedGamesResult.fromJson(json.decode(response.body));
  }
}

class FetchedGamesResult {
  final List<Game> games;

  FetchedGamesResult(this.games);

  factory FetchedGamesResult.fromJson(dynamic json) {
    List<Game> games = new List();
    final months = (json['lscd'] as List)
        .cast<Map<String, Object>>()
        .map((Map<String, Object> item) {
      return Month.fromJson(item);
    }).toList();

    for (var i = 0; i < months.length; i++) {
      games.addAll(months[i].games);
    }

    return FetchedGamesResult(games);
  }
}
