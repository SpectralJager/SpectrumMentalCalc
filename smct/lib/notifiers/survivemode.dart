import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/models/game.dart';

class SurviveNotifier extends StateNotifier<Game> {
  SurviveNotifier(Game? sm) : super(sm ?? Game());

  void healthDec() {
    if (this.state.health > 0) {
      this.state = this.state.copyWith(health: this.state.health - 1);
    }
  }

  void submitAnswer(int answer) {
    if (this.state.result == answer) {
    } else {}
  }
}
