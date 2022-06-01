import 'package:smct/models/game.dart';

class TimerMode {
  final String timer;
  final Game game;

  const TimerMode({
    this.timer = "00:00:00",
    this.game = const Game(),
  });

  TimerMode copyFrom(String? timer, Game? game) {
    return TimerMode(
      timer: timer ?? this.timer,
      game: game ?? this.game,
    );
  }
}
