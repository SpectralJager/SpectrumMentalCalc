import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smct/models/game.dart';
import 'package:smct/notifiers/survivemode.dart';

void main() {
  final sn_prov = StateNotifierProvider<SurviveNotifier, Game>(
    (ref) => SurviveNotifier(
      Game(health: 3),
    ),
  );
  test(
      "SurviveNotifierProvider created with standart parameters and change health",
      () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

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
}
