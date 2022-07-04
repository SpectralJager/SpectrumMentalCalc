import 'package:bloc/bloc.dart';

class NavigationRailsCubit extends Cubit<int> {
  NavigationRailsCubit() : super(0);

  void changeHubView(int newIndex) {
    emit(newIndex);
  }
}
