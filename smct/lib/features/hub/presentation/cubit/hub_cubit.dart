import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HubCubit extends Cubit<int> {
  HubCubit() : super(0);

  final List<Widget> _homeItem = [
    Container(
      key: const ValueKey(0),
      width: 300,
      height: 300,
      color: Colors.purple,
    ),
    Container(
      key: const ValueKey(1),
      width: 300,
      height: 300,
      color: Colors.red,
    ),
    Container(
      key: const ValueKey(2),
      width: 300,
      height: 300,
      color: Colors.green,
    ),
  ];

  void changeIndex(int newIndex) {
    emit(newIndex);
  }

  Widget get currentHubPage => _homeItem[state];
}
