import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smct/core/constants/constants.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameType gameType;
  final GameMode gameMode;

  GameBloc({required this.gameType, required this.gameMode})
      : super(GameRun()) {
    // TODO: Event handlers
  }
}
