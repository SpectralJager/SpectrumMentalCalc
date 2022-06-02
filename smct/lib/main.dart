import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/models/game.dart';
import 'package:smct/notifiers/survivemode.dart';
import 'package:smct/notifiers/timermode.dart';

void main() {
  runApp(ProviderScope(child: const MentalCalc()));
}

class MentalCalc extends StatelessWidget {
  const MentalCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameView(),
    );
  }
}

final temp = StateNotifierProvider<TimerNotifier, Game>(
  (ref) => TimerNotifier(Game(
    health: 3,
    delta_point: 1,
    left_max: 10,
    left_min: 1,
    right_max: 10,
    right_min: 1,
    lvl: 1,
    timer: Duration(minutes: 3),
  )),
);

class GameView extends ConsumerWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(ref.watch(temp.notifier).timerToStr()),
    );
  }
}
