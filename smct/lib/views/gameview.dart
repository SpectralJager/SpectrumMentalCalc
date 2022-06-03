import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/globalstate.dart';
import 'package:smct/models/game.dart';
import 'package:smct/notifiers/gamenotifier.dart';

class GameView extends ConsumerStatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameViewState();
}

class _GameViewState extends ConsumerState<GameView> {
  late final StateNotifierProvider<GameNotifier, Game> offline_game;
  @override
  void initState() {
    super.initState();

    offline_game = StateNotifierProvider<GameNotifier, Game>(
      (_) => GameNotifier(
        Game(
          health: 3,
          delta_point: 1,
          left_max: 10,
          left_min: 1,
          right_max: 10,
          right_min: 1,
          lvl: 1,
          points: 0,
          mode: ref.read(offline_game_mode),
        ),
      ),
    );

    ref.read(offline_game.notifier).generateValues();
  }

  @override
  Widget build(BuildContext context) {
    Game game = ref.watch(offline_game);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton.small(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
                Container(
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < game.health; i++)
                        Icon(
                          Icons.heart_broken,
                          color: Theme.of(context).colorScheme.onBackground,
                        )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
