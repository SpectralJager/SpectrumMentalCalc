import 'scope.dart';

enum Mode {
  Summation,
  Subtraction,
  Multiplication,
  Division,
}

class Game {
  final int left_value, right_value, points, delta_point, lvl, health;
  final Scope left_scope, right_scope;
  final Mode mode;

  const Game({
    this.left_value = 1,
    this.right_value = 1,
    this.left_scope = const Scope(10, 1),
    this.right_scope = const Scope(10, 1),
    this.points = 0,
    this.delta_point = 1,
    this.lvl = 1,
    this.mode = Mode.Summation,
    this.health = 3,
  });

  Game copyWith({
    int? left_value,
    int? right_value,
    Scope? left_scope,
    Scope? right_scope,
    int? points,
    int? delta_point,
    int? lvl,
    Mode? mode,
    int? health,
  }) {
    return Game(
      left_value: left_value ?? this.left_value,
      right_value: right_value ?? this.right_value,
      left_scope: left_scope ?? this.left_scope,
      right_scope: right_scope ?? this.right_scope,
      points: points ?? this.points,
      delta_point: delta_point ?? this.delta_point,
      lvl: lvl ?? this.lvl,
      mode: mode ?? this.mode,
      health: health ?? this.health,
    );
  }
}
