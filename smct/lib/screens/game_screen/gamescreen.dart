import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/blocs/game/game_bloc.dart';
import 'package:smct/blocs/selectedofflinetype/selectedofflinetype_cubit.dart';
import 'package:smct/models/game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen(
      {Key? key, required this.offlineGameType, required this.gameMode})
      : super(key: key);

  final OfflineGameType offlineGameType;
  final Mode gameMode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameBloc(Game(
        mode: gameMode,
      )),
      child: _GameScreen(offlineGameType: offlineGameType, gameMode: gameMode),
    );
  }
}

class _GameScreen extends StatelessWidget {
  const _GameScreen(
      {Key? key, required this.offlineGameType, required this.gameMode})
      : super(key: key);

  final OfflineGameType offlineGameType;
  final Mode gameMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('${this.offlineGameType}')),
    );
  }
}
