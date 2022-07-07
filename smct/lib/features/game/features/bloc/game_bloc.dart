// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smct/core/constants/constants.dart';
import 'package:smct/features/game/domain/entity/game_entity.dart';
import 'package:smct/features/game/domain/usecase/game_usecase.dart';
import 'package:smct/features/game/domain/usecase/ticker_usecase.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameType gameType;
  final GameMode gameMode;
  late final GameUsecase gameUsecase;

  static const int time = 3 * 60;
  static const int health = 3;
  static const int deltaPoint = 10;
  StreamSubscription<int>? _tickerSubscription;

  GameBloc({required this.gameType, required this.gameMode})
      : super(GameRun(
            gameEntity: GameEntity.initial(), health: health, time: time)) {
    switch (gameType) {
      case GameType.Survive:
        gameUsecase = SurviveGameUsecase();
        break;
      case GameType.Endurence:
        gameUsecase = EnduranceGameUsecase();
        _tickerSubscription =
            const Ticker().tick(ticks: time).listen((duration) {
          add(TimerTick(duration));
        });
        break;
      case GameType.Timer:
        gameUsecase = TimerGameUsecase();
        break;
    }
    on<GameSubmitAnswer>(_onSubmit);
    on<GameFinish>(_onFinish);
    on<TimerTick>(_onTick);
  }

  void _onSubmit(GameSubmitAnswer event, Emitter<GameState> emit) {
    var health = (state as GameRun).health;
    var time = (state as GameRun).time;
    switch (gameType) {
      case GameType.Survive:
        var temp = gameUsecase.submitAnswer(
          gameEntity: state.gameEntity,
          gameMode: gameMode,
          answer: event.answer,
          deltaPoint: deltaPoint,
          args: health,
        );
        health = temp['health'];
        emit(health == 0
            ? GameRun(
                gameEntity: temp['gameEntity'],
                health: health,
                time: time,
              )
            : GameComplite(gameEntity: temp['gameEntity']));
        break;
      case GameType.Endurence:
        var temp = gameUsecase.submitAnswer(
          gameEntity: state.gameEntity,
          gameMode: gameMode,
          answer: event.answer,
          deltaPoint: deltaPoint,
          args: health,
        );
        emit(
          GameRun(
            gameEntity: temp['gameEntity'],
            health: health,
            time: temp['time'],
          ),
        );
        break;
      case GameType.Timer:
        var temp = gameUsecase.submitAnswer(
          gameEntity: state.gameEntity,
          gameMode: gameMode,
          answer: event.answer,
          deltaPoint: deltaPoint,
          args: health,
        );
        emit(
          GameRun(
            gameEntity: temp['gameEntity'],
            health: health,
            time: temp['time'],
          ),
        );
        break;
    }
  }

  void _onFinish(GameFinish event, Emitter<GameState> emit) {}

  void _onTick(TimerTick event, Emitter<GameState> emit) {
    var tempState = (state as GameRun);
    emit(
      event.duration == 0
          ? GameRun(
              gameEntity: tempState.gameEntity,
              health: tempState.health,
              time: event.duration,
            )
          : GameComplite(gameEntity: tempState.gameEntity),
    );
  }
}
