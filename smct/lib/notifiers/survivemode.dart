import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/models/game.dart';

class SurviveNotifier extends StateNotifier<Game> {
  SurviveNotifier(Game sm) : super(sm);

  void healthDec() {
    if (this.state.health > 0) {
      this.state = this.state.copyWith(health: this.state.health - 1);
    }
  }

  void submitAnswer(int answer) {
    if (this.state.result == answer) {
      this.state = this.state.incrementPoints();
      if (this.state.points / 20 == this.state.lvl) {
        this.state = this.state.changeLvl();
        this.state = this.state.changeMinMax();
      }
    } else {
      this.state = this.state.decrementPoints();
      this.healthDec();
    }
    this.state = this.state.generateValues();
  }
}