import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

enum OfflineGameType {
  Timer,
  Survive,
  Endurance,
}

class SelectedOfflineTypeCubit extends Cubit<OfflineGameType> {
  SelectedOfflineTypeCubit() : super(OfflineGameType.Timer);

  void changeOfflineType(OfflineGameType new_type) {
    emit(new_type);
  }
}
