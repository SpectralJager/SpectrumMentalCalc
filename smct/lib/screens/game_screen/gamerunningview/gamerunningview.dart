import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/blocs/game/game_bloc.dart';
import 'package:smct/blocs/selectedofflinetype/selectedofflinetype_cubit.dart';
import 'package:smct/models/game.dart';
import 'package:smct/screens/game_screen/gamerunningview/widgets.dart';

class GameRunnginView extends StatelessWidget {
  GameRunnginView(
      {Key? key, required this.offlineGameType, required this.gameMode})
      : super(key: key);
  final OfflineGameType offlineGameType;
  final Mode gameMode;
  late final TextEditingController txt_edit_controller =
      TextEditingController(text: '');
  final num_pad = ['7', '8', '9', '4', '5', '6', '1', '2', '3'];

  @override
  Widget build(BuildContext context) {
    var game = context.select((GameBloc bloc) => bloc.state.game);
    var points = game.points;
    var left_value = game.left_value;
    var right_value = game.right_value;
    var sign;
    var buttons_text_style = Theme.of(context)
        .textTheme
        .labelLarge!
        .copyWith(color: Theme.of(context).colorScheme.onPrimary);
    switch (game.mode) {
      case Mode.Summation:
        sign = '+';
        break;
      case Mode.Subtraction:
        sign = '-';
        break;
      case Mode.Multiplication:
        sign = '*';
        break;
      case Mode.Division:
        sign = '/';
        break;
    }
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton.small(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.clear),
              ),
              Container(
                child: Text(
                  "$points p",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 120,
          height: 30,
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < game.health; i++)
                Icon(
                  Icons.heart_broken,
                  size: 28,
                  color: Theme.of(context).colorScheme.onPrimary,
                )
            ],
          ),
        ),
        Text(
          "$left_value $sign $right_value",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: 80,
          ),
          margin: EdgeInsets.only(top: 20),
          child: TextFormField(
            controller: this.txt_edit_controller,
            enabled: false,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            decoration: InputDecoration(
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Answer: ',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.9,
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            children: [
              for (var i in this.num_pad)
                NumPadBtn(
                  txt_edit_controller: txt_edit_controller,
                  buttons_text_style: buttons_text_style,
                  text: i,
                ),
              ElevatedButton(
                onPressed: () {
                  this.txt_edit_controller.clear();
                },
                child: Icon(
                  Icons.clear,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
              ),
              ElevatedButton(
                onPressed: () {
                  this.txt_edit_controller.text += '0';
                },
                child: Text(
                  '0',
                  style: buttons_text_style,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (this.txt_edit_controller.text != '') {
                    context.read<GameBloc>().add(GameEventSubmit(
                        int.parse(this.txt_edit_controller.text)));
                    this.txt_edit_controller.clear();
                  }
                },
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
