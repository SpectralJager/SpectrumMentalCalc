import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/globalstate.dart';
import 'package:smct/models/game.dart';
import 'package:smct/notifiers/survivenotifier.dart';

final offline_game =
    StateNotifierProvider.family<SurviveNotifier, Game, Mode>((ref, mode) {
  Game game = Game(
    delta_point: 1,
    lvl: 1,
    points: 0,
    mode: mode,
    health: 3,
  );
  game = game.generateValues();
  return SurviveNotifier(game);
});

class GameView extends ConsumerStatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameViewState();
}

class _GameViewState extends ConsumerState<GameView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Game game = ref.watch(offline_game(ref.read(offline_game_mode)));
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
