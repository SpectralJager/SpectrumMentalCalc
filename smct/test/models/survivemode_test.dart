import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smct/models/game.dart';
import 'package:smct/notifiers/survivemode.dart';

void main() {
  test(
      "SurviveNotifierProvider created with standart parameters and change health",
      () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final sn_prov = StateNotifierProvider<SurviveNotifier, Game>(
      (ref) => SurviveNotifier(
        Game(health: 3),
      ),
    );

    expect(container.read(sn_prov).health, equals(3));
    container.read(sn_prov.notifier).healthDec();
    expect(container.read(sn_prov).health, equals(2));
    container.read(sn_prov.notifier).healthDec();
    expect(container.read(sn_prov).health, equals(1));
    container.read(sn_prov.notifier).healthDec();
    expect(container.read(sn_prov).health, equals(0));
    container.read(sn_prov.notifier).healthDec();
    expect(container.read(sn_prov).health, isNot(-1));
  });
  test("SurviveNotifierProvider test submit answer", () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final sn_prov = StateNotifierProvider<SurviveNotifier, Game>(
      (ref) => SurviveNotifier(
        Game(
          health: 3,
          delta_point: 1,
          left_max: 10,
          left_min: 1,
          right_max: 10,
          right_min: 1,
          lvl: 1,
          mode: Mode.Summation,
        ),
      ),
    );

    for (int i = 1; i <= 50; i++) {
      container
          .read(sn_prov.notifier)
          .submitAnswer(container.read(sn_prov).result);
      expect(container.read(sn_prov).points, i);
    }
    expect(container.read(sn_prov).health, 3);
    expect(container.read(sn_prov).lvl, 3);
    container
        .read(sn_prov.notifier)
        .submitAnswer(container.read(sn_prov).result - 1);
    expect(container.read(sn_prov).health, 2);
    expect(container.read(sn_prov).points, 49);
  });
}
