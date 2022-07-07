part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class GameSubmitAnswer extends GameEvent {
  final int answer;

  GameSubmitAnswer({required String answer}) : answer = int.parse(answer);
}

class GameFinish extends GameEvent {}

class TimerTick extends GameEvent {
  final int duration;

  const TimerTick(this.duration);
}
