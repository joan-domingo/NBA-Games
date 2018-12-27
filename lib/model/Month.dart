import 'package:flutter_app/model/Game.dart';

class Month {
  final List<Game> games;

  Month(this.games);

  factory Month.fromJson(Map<String, Object> json) {
    final items = ((json["mscd"] as Map<String, Object>)['g'] as List)
        .cast<Map<String, Object>>()
        .map((Map<String, Object> item) {
      return Game.fromJson(item);
    }).toList();
    return Month(items);
  }
}