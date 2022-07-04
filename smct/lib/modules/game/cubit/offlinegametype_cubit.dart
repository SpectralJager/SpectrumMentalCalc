import 'package:bloc/bloc.dart';

enum OfflineGameType {
  Timer,
  Survive,
  Endurance,
}

class OfflineGameTypeCubit extends Cubit<OfflineGameType> {
  OfflineGameTypeCubit() : super(OfflineGameType.Timer);

  void changeOfflineType(OfflineGameType newType) {
    emit(newType);
  }
}
