import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'homenav_state.dart';

class HomeNavCubit extends Cubit<HomeNavState> {
  HomeNavCubit() : super(const HomeNavInitial());

  void changeIndex(int new_index) {
    emit(HomeNavSelected(new_index));
  }
}
