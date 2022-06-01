import 'dart:math';

import 'package:smct/models/game.dart';

class GameInterfae {
  Game generateValues(Game game) {
    return game.copyWith(
      left_value:
          Random().nextInt(game.left_max - game.left_min) + game.left_min,
      right_value:
          Random().nextInt(game.right_max - game.right_min) + game.right_min,
    );
  }

  Game incrementPoints(Game game) {
    return game.copyWith(
      points: game.points + game.delta_point,
    );
  }

  Game decrementPoints(Game game) {
    return game.copyWith(
      points: game.points - game.delta_point,
    );
  }

  Game changeDeltaPoint(Game game, int delta_point) {
    return game.copyWith(delta_point: delta_point);
  }

  Game changeMinMax(Game game) {
    var new_max_left, new_max_right, new_min_left, new_min_right;
    switch (game.lvl % 2) {
      case 0:
        new_min_left = game.left_max;
        new_max_left = game.left_max * 10;
        break;
      case 1:
        new_min_right = game.right_max;
        new_max_right = game.right_max * 10;
        break;
    }
    return game.copyWith(
      left_max: new_max_left,
      left_min: new_min_left,
      right_max: new_max_right,
      right_min: new_min_right,
    );
  }
}
