import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:smct/models/scope.dart';

enum Mode {
  Summation,
  Subtraction,
  Multiplication,
  Division,
}

@immutable
class Game {
  final int left_value, right_value, points, delta_point, lvl, health;
  final Scope left_scope, right_scope;
  final Mode mode;

  const Game({
    this.left_value = 0,
    this.right_value = 0,
    this.left_scope = const Scope(10, 1),
    this.right_scope = const Scope(10, 1),
    this.points = 0,
    this.delta_point = 0,
    this.lvl = 0,
    this.mode = Mode.Summation,
    this.health = 0,
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

  Game generateValues() {
    int left = Random().nextInt(this.left_scope.max - this.left_scope.min) +
        this.left_scope.min;
    int right = Random().nextInt(this.right_scope.max - this.right_scope.min) +
        this.right_scope.min;
    if (this.mode == Mode.Division) {
      int left = Random().nextInt(this.left_scope.max - this.left_scope.min) +
          this.left_scope.min;
      while (left % right != 0) {
        int right =
            Random().nextInt(this.right_scope.max - this.right_scope.min) +
                this.right_scope.min;
      }
    }
    return this.copyWith(left_value: left, right_value: right);
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

  Game changeMinMax() {
    Scope? left, right;
    switch (this.lvl % 2) {
      case 0:
        left = Scope(this.left_scope.max * 10, this.left_scope.max);
        break;
      case 1:
        right = Scope(this.right_scope.max * 10, this.right_scope.max);
        break;
    }
    return this.copyWith(
      left_scope: left ?? this.left_scope,
      right_scope: right ?? this.right_scope,
    );
  }

  Game changeLvl() {
    return this.copyWith(lvl: this.lvl + 1);
  }

  int get result {
    int temp;
    switch (this.mode) {
      case Mode.Summation:
        temp = this.left_value + this.right_value;
        break;
      case Mode.Subtraction:
        temp = this.left_value - this.right_value;
        break;
      case Mode.Division:
        temp = (this.left_value / this.right_value) as int;
        break;
      case Mode.Multiplication:
        temp = this.left_value * this.right_value;
        break;
    }
    return temp;
  }
}
