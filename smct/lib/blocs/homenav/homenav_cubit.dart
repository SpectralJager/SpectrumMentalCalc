import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class HomeNavCubit extends Cubit<int> {
  HomeNavCubit() : super(0);

  void changeIndex(int new_index) {
    emit(new_index);
  }
}
