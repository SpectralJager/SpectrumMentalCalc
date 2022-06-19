import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/blocs/game/game_bloc.dart';
import 'package:smct/blocs/selectedofflinetype/selectedofflinetype_cubit.dart';
import 'package:smct/models/game.dart';
import 'package:smct/screens/game_screen/gamefinishview/gamefinishview.dart';
import 'package:smct/screens/game_screen/gameinitview/gameinitview.dart';
import 'package:smct/screens/game_screen/gamerunningview/gamerunningview.dart';

class GameScreen extends StatelessWidget {
  const GameScreen(
      {Key? key, required this.offlineGameType, required this.gameMode})
      : super(key: key);

  final OfflineGameType offlineGameType;
  final Mode gameMode;

  @override
  Widget build(BuildContext context) {
    var game;
    switch (gameMode) {
      case Mode.Division:
        game = Game(mode: gameMode, left_scope: Scope(100, 10));
        break;
      default:
        game = Game(mode: gameMode);
        break;
    }
    return BlocProvider(
      create: (_) => GameBloc(game),
      child: _GameScreen(offlineGameType: offlineGameType, gameMode: gameMode),
    );
  }
}

class _GameScreen extends StatelessWidget {
  final OfflineGameType offlineGameType;
  final Mode gameMode;

  _GameScreen({Key? key, required this.offlineGameType, required this.gameMode})
      : super(key: key);

  var screen;

  @override
  Widget build(BuildContext context) {
    var state = context.select((GameBloc bloc) => bloc.state);
    if (state is GameStateInit) {
      this.screen =
          GameInitView(offlineGameType: offlineGameType, gameMode: gameMode);
    } else if (state is GameStateRunning) {
      this.screen =
          GameRunnginView(offlineGameType: offlineGameType, gameMode: gameMode);
    } else if (state is GameStateFinish) {
      this.screen = GameFinishView();
    }
    return Scaffold(body: screen);
  }
}
