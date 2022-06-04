import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/models/game.dart';

class SurviveNotifier extends StateNotifier<Game> {
  SurviveNotifier(Game sm) : super(sm);

  int health = 3;

  void submitAnswer(int answer) {
    Game temp = this.state.copyWith();
    if (temp.result == answer) {
      temp = temp.incrementPoints();
      if (temp.points / 20 == temp.lvl) {
        temp = temp.changeLvl();
        temp = temp.changeMinMax();
      }
    } else {
      temp = temp.decrementPoints();
    }
    temp = temp.generateValues();
    this.state = temp;
  }

  void healthDec() {
    this.state = this.state.copyWith(health: this.state.health - 1);
  }
}
