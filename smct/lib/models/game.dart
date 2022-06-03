import 'dart:math';

import 'package:flutter/foundation.dart';

enum Mode {
  Summation,
  Subtraction,
  Multiplication,
  Division,
}

@immutable
class Game {
  final int left_value,
      right_value,
      left_max,
      left_min,
      right_max,
      right_min,
      points,
      delta_point,
      health,
      lvl;
  final Mode mode;
  final Duration timer, delta_time;

  String get timerToStr {
    return "${this.timer.inMinutes.toString()}:${this.timer.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  const Game({
    this.left_value = 0,
    this.right_value = 0,
    this.left_max = 0,
    this.left_min = 0,
    this.right_max = 0,
    this.right_min = 0,
    this.points = 0,
    this.delta_point = 0,
    this.health = 0,
    this.timer = const Duration(seconds: 0),
    this.delta_time = const Duration(seconds: 0),
    this.mode = Mode.Summation,
    this.lvl = 0,
  });

  Game copyWith({
    int? left_value,
    int? right_value,
    int? left_max,
    int? left_min,
    int? right_max,
    int? right_min,
    int? points,
    int? delta_point,
    int? health,
    int? lvl,
    Duration? timer,
    Duration? delta_time,
    Mode? mode,
  }) {
    return Game(
      left_value: left_value ?? this.left_value,
      right_value: right_value ?? this.right_value,
      left_max: left_max ?? this.left_max,
      left_min: left_min ?? this.left_min,
      right_max: right_max ?? this.right_max,
      right_min: right_min ?? this.right_min,
      points: points ?? this.points,
      delta_point: delta_point ?? this.delta_point,
      health: health ?? this.health,
      lvl: lvl ?? this.lvl,
      timer: timer ?? this.timer,
      delta_time: delta_time ?? this.delta_time,
      mode: mode ?? this.mode,
    );
  }
}
