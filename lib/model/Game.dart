class Game {
  final String id;
  final String city;
  final String venue;
  final String hTeam;
  final String hScore;
  final String vTeam;
  final String vScore;

  Game(
    this.id,
    this.city,
    this.venue,
    this.hTeam,
    this.hScore,
    this.vTeam,
    this.vScore,
  );

  factory Game.fromJson(Map<String, Object> json) {
    return Game(
      json['gid'],
      json['ac'],
      json['an'],
      (json['h'] as Map<String, Object>)['ta'],
      (json['h'] as Map<String, Object>)['s'],
      (json['v'] as Map<String, Object>)['ta'],
      (json['v'] as Map<String, Object>)['s'],
    );
  }
}
