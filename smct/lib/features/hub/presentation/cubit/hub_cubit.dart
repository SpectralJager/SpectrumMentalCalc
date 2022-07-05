import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smct/features/select_game/presentation/widgets/select_game_page.dart';

class HubCubit extends Cubit<int> {
  HubCubit() : super(0);

  final List<Widget> _hubItems = [
    SelectGamePage(),
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

  Widget get currentHubPage => _hubItems[state];
}
