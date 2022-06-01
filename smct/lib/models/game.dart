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
  final String timer, delta_time;
  final Mode mode;

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
    this.timer = "00:00",
    this.delta_time = "00:00",
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
    String? timer,
    String? delta_time,
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

  Game generateValues() {
    return this.copyWith(
      left_value:
          Random().nextInt(this.left_max - this.left_min) + this.left_min,
      right_value:
          Random().nextInt(this.right_max - this.right_min) + this.right_min,
    );
  }

  Game incrementPoints() {
    return this.copyWith(
      points: this.points + this.delta_point,
    );
  }

  Game decrementPoints() {
    return this.copyWith(
      points: this.points - this.delta_point,
    );
  }

  Game changeDeltaPoint(int delta_point) {
    return this.copyWith(delta_point: delta_point);
  }

  Game changeMinMax() {
    var new_max_left, new_max_right, new_min_left, new_min_right;
    switch (this.lvl % 2) {
      case 0:
        new_min_left = this.left_max;
        new_max_left = this.left_max * 10;
        break;
      case 1:
        new_min_right = this.right_max;
        new_max_right = this.right_max * 10;
        break;
    }
    return this.copyWith(
      left_max: new_max_left,
      left_min: new_min_left,
      right_max: new_max_right,
      right_min: new_min_right,
    );
  }

  Game changeLvl() {
    return Game(lvl: this.lvl + 1);
  }

  int get result {
    var temp;
    switch (this.mode) {
      case Mode.Summation:
        temp = this.left_value + this.right_value;
        break;
      case Mode.Subtraction:
        temp = this.left_value - this.right_value;
        break;
      case Mode.Division:
        temp = this.left_value / this.right_value;
        break;
      case Mode.Multiplication:
        temp = this.left_value * this.right_value;
        break;
    }
    return temp;
  }
}
