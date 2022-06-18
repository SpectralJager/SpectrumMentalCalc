part of 'homenav_cubit.dart';

abstract class HomeNavState extends Equatable {
  final int _current_index;

  const HomeNavState(this._current_index);

  int get current_index => this._current_index;

  @override
  List<Object> get props => [this._current_index];
}

class HomeNavInitial extends HomeNavState {
  const HomeNavInitial() : super(0);
}

class HomeNavSelected extends HomeNavState {
  const HomeNavSelected(int new_index) : super(new_index);
}
