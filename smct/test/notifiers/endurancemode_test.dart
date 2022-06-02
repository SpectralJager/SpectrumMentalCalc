import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smct/models/game.dart';
import 'package:smct/notifiers/endurancemode.dart';

void main() {
  test('endurancemode test timer', () {
    var em = StateNotifierProvider<EnduranceNotifier, Game>(
      (ref) {
        return EnduranceNotifier(Game(
          mode: Mode.Multiplication,
          delta_point: 1,
          left_max: 10,
          left_min: 1,
          right_max: 10,
          right_min: 1,
          lvl: 1,
          timer: Duration(seconds: 20),
        ));
      },
    );

    final container = ProviderContainer();
    addTearDown(container.dispose);

    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (container.read(em).timer.inSeconds == timer.tick) timer.cancel();
        container.read(em.notifier).submitAnswer(container.read(em).result);
        expect(container.read(em).points, timer.tick);
        container.read(em.notifier).timerDec();
      },
    );
  });
}
