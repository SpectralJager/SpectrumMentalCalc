part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  const GameState({required this.gameEntity});

  final GameEntity gameEntity;

  @override
  List<Object> get props => [gameEntity];
}

class GameRun extends GameState {
  final int health;
  final int time;

  const GameRun({
    required super.gameEntity,
    required this.health,
    required this.time,
  });

  @override
  List<Object> get props => [gameEntity, health, time];
}

class GameComplite extends GameState {
  const GameComplite({required super.gameEntity});
}
