import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/models/game.dart';
import 'package:smct/notifiers/gamenotifier.dart';

final hub_page_index = StateProvider<int>(
  (ref) => 0,
);
final offline_game_mode = StateProvider<Mode>(
  (ref) => Mode.Summation,
);
