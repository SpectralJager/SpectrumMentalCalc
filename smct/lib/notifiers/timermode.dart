import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/models/game.dart';

class TimerNotifier extends StateNotifier<Game> {
  TimerNotifier(Game game) : super(game);

  void submitAnswer(int answer) {
    if (this.state.result == answer) {
      this.state = this.state.incrementPoints();
      if (this.state.points / 20 == this.state.lvl) {
        this.state = this.state.changeLvl();
        this.state = this.state.changeMinMax();
      }
    } else {
      this.state = this.state.decrementPoints();
    }
    this.state = this.state.generateValues();
  }

  String timerToStr() {
    return "${this.state.timer.inMinutes.toString()}:${this.state.timer.inSeconds.remainder(60).toString().padLeft(2, '0')}";
  }

  void timerDec() {
    this.state =
        this.state.copyWith(timer: this.state.timer - Duration(seconds: 1));
  }
}
