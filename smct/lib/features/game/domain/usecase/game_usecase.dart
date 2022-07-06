import 'dart:math';

import 'package:smct/core/constants/constants.dart';
import 'package:smct/features/game/domain/entity/game_entity.dart';

abstract class GameUsecase {
  GameEntity gameEntity;
  final GameMode gameMode;

  GameUsecase({required this.gameEntity, required this.gameMode});

  GameEntity generateValues() {
    int left = _generateValue(gameEntity.leftScope);
    int right = _generateValue(gameEntity.rightScope);
    if (gameMode == GameMode.Division) {
      while (left % right != 0 || right == 1 || right == left) {
        left = _generateValue(gameEntity.leftScope);
        right = _generateValue(gameEntity.rightScope);
      }
    } else if (gameMode == GameMode.Subtraction) {
      while (left < right) {
        left = _generateValue(gameEntity.leftScope);
        right = _generateValue(gameEntity.rightScope);
      }
    }
    return gameEntity.copyWith(leftValue: left, rightValue: right);
  }

  int _generateValue(Scope scope) {
    return Random().nextInt(scope.max - scope.min) + scope.min;
  }

  GameEntity incrementPoints(int deltaPoint) {
    return gameEntity.copyWith(
      score: gameEntity.score + deltaPoint,
    );
  }

  GameEntity decrementPoints(int deltaPoint) {
    return gameEntity.copyWith(
      score: gameEntity.score + deltaPoint,
    );
  }

  GameEntity changeScope() {
    Scope? leftScope, rightScope;
    switch (gameEntity.lvl % 2) {
      case 0:
        leftScope =
            Scope(gameEntity.leftScope.max * 10, gameEntity.leftScope.max);
        break;
      case 1:
        rightScope =
            Scope(gameEntity.rightScope.max * 10, gameEntity.rightScope.max);
        break;
    }
    return gameEntity.copyWith(
      leftScope: leftScope ?? gameEntity.leftScope,
      rightScope: rightScope ?? gameEntity.rightScope,
    );
  }

  GameEntity changeLvl() {
    return gameEntity.copyWith(lvl: gameEntity.lvl + 1);
  }

  GameEntity submitAnswer(int answer, int deltaPoint) =>
      throw UnimplementedError();

  int get result {
    int temp;
    switch (gameMode) {
      case GameMode.Summation:
        temp = gameEntity.leftValue + gameEntity.rightValue;
        break;
      case GameMode.Subtraction:
        temp = gameEntity.leftValue - gameEntity.rightValue;
        break;
      case GameMode.Division:
        temp = (gameEntity.leftValue / gameEntity.rightValue).round();
        break;
      case GameMode.Multiplication:
        temp = (gameEntity.leftValue * gameEntity.rightValue).round();
        break;
    }
    return temp;
  }
}

class SurviveGameUsecase extends GameUsecase {
  int health;

  SurviveGameUsecase({
    required super.gameEntity,
    required super.gameMode,
    this.health = 3,
  });

  @override
  GameEntity submitAnswer(int answer, int deltaPoint) {
    if (answer == result) {
      gameEntity = incrementPoints(deltaPoint);
      if (gameEntity.score % (5 * gameEntity.lvl) == 0) {
        gameEntity = changeLvl();
        gameEntity = changeScope();
      }
    } else {
      gameEntity = decrementPoints(deltaPoint);
      health = health - 1;
    }
    return gameEntity.copyWith();
  }
}
