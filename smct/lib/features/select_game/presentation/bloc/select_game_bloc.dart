import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_game_event.dart';
part 'select_game_state.dart';

class SelectGameBloc extends Bloc<SelectGameEvent, SelectGameState> {
  SelectGameBloc() : super(SelectGameInitial()) {
    on<SelectGameEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
