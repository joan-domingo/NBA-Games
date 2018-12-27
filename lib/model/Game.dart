class Game {
  final String id;
  final String location;
  final String hTeam;
  final String vTeam;

  Game(this.id, this.location, this.vTeam, this.hTeam);

  factory Game.fromJson(Map<String, Object> json) {
    return Game(
        json['gid'],
        json['ac'],
        (json['h'] as Map<String, Object>)['ta'],
        (json['v'] as Map<String, Object>)['ta']);
  }
}
