import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/models/game.dart';

class GameNotifier extends StateNotifier<Game> {
  GameNotifier(Game sm) : super(sm);

  void healthDec() {
    if (this.state.health > 0) {
      this.state = this.state.copyWith(health: this.state.health - 1);
    }
  }

  void submitAnswer(int answer) {
    if (this.result == answer) {
      this.incrementPoints();
      if (this.state.points / 20 == this.state.lvl) {
        this.changeLvl();
        this.changeMinMax();
      }
    } else {
      this.decrementPoints();
      this.healthDec();
    }
    this.generateValues();
  }

  void changeGameMode(Mode mode) {
    this.state = this.state.copyWith(mode: mode);
  }

  void generateValues() {
    int left = Random().nextInt(this.state.left_max - this.state.left_min) +
        this.state.left_min;
    int right = Random().nextInt(this.state.right_max - this.state.right_min) +
        this.state.right_min;
    if (this.state.mode == Mode.Division) {
      left = Random().nextInt(this.state.left_max - this.state.left_min) +
          this.state.left_min;
      while (left % right != 0) {
        int right =
            Random().nextInt(this.state.right_max - this.state.right_min) +
                this.state.right_min;
      }
    }
    this.state = this.state.copyWith(left_value: left, right_value: right);
  }

  void incrementPoints() {
    this.state = this.state.copyWith(
          points: this.state.points + this.state.delta_point,
        );
  }

  void decrementPoints() {
    this.state = this.state.copyWith(
          points: this.state.points - this.state.delta_point,
        );
  }

  void changeDeltaPoint(int delta_point) {
    this.state = this.state.copyWith(delta_point: delta_point);
  }

  void changeMinMax() {
    var new_max_left, new_max_right, new_min_left, new_min_right;
    switch (this.state.lvl % 2) {
      case 0:
        new_min_left = this.state.left_max;
        new_max_left = this.state.left_max * 10;
        break;
      case 1:
        new_min_right = this.state.right_max;
        new_max_right = this.state.right_max * 10;
        break;
    }
    this.state = this.state.copyWith(
          left_max: new_max_left,
          left_min: new_min_left,
          right_max: new_max_right,
          right_min: new_min_right,
        );
  }

  void changeLvl() {
    this.state = this.state.copyWith(lvl: this.state.lvl + 1);
  }

  int get result {
    int temp;
    switch (this.state.mode) {
      case Mode.Summation:
        temp = this.state.left_value + this.state.right_value;
        break;
      case Mode.Subtraction:
        temp = this.state.left_value - this.state.right_value;
        break;
      case Mode.Division:
        temp = (this.state.left_value / this.state.right_value) as int;
        break;
      case Mode.Multiplication:
        temp = this.state.left_value * this.state.right_value;
        break;
    }
    return temp;
  }

  void timerInc() {
    this.state =
        this.state.copyWith(timer: this.state.timer + this.state.delta_time);
  }

  void timerDec() {
    this.state =
        this.state.copyWith(timer: this.state.timer - Duration(seconds: 1));
  }

  void changeDeltaTime(Duration new_delta) {
    this.state = this.state.copyWith(delta_time: new_delta);
  }
}
