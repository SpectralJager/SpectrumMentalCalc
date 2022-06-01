import 'package:smct/models/game.dart';

class EnduranceMode {
  final String timer;
  final String delta_time;
  final Game game;

  EnduranceMode({
    this.timer = "00:00",
    this.delta_time = "00:00",
    this.game = const Game(),
  });

  EnduranceMode copyFrom({String? timer, String? delta_time, Game? game}) {
    return EnduranceMode(
      timer: timer ?? this.timer,
      delta_time: delta_time ?? this.delta_time,
      game: game ?? this.game,
    );
  }
}
