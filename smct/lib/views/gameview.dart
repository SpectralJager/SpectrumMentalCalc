// ignore_for_file: non_constant_identifier_names, unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/blocs/game/game.dart';
import 'package:smct/models/gamemodel.dart';
import 'package:smct/views/widgets/widgets.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key, required this.mode}) : super(key: key);
  final Mode mode;

  @override
  Widget build(BuildContext context) {
    // var type = context.read<GameSelectBloc>().state.type;
    return BlocProvider(
      create: (_) => GameBloc(Game(mode: mode)),
      child: const GameView(),
    );
  }
}

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late final TextEditingController txt_edit_controller;
  late String sign;

  final num_pad = ['7', '8', '9', '4', '5', '6', '1', '2', '3'];
  @override
  void initState() {
    this.txt_edit_controller = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = context.select((GameBloc bloc) => bloc.state);
    var game = context.select((GameBloc bloc) => bloc.state.game);
    var points = game.points;
    var left_value = game.left_value;
    var right_value = game.right_value;
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
    var buttons_text_style = Theme.of(context)
        .textTheme
        .labelLarge!
        .copyWith(color: Theme.of(context).colorScheme.onPrimary);
    Widget? current_state_screen;
    if (state is GameStateRunning) {
      current_state_screen = GameRunning();
    } else if (state is GameStateFinish) {
      current_state_screen = GameFinishing();
    } else if (state is GameStateInit) {
      current_state_screen = GameInit();
    }
    return Scaffold(
      body: current_state_screen,
    );
  }
}

class GameRunning extends StatelessWidget {
  const GameRunning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton.small(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.clear),
              ),
              Text(
                "$points p",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ],
          ),
        ),
        Container(
          width: 120,
          height: 30,
          margin: const EdgeInsets.only(bottom: 20),
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
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
          ),
          margin: const EdgeInsets.only(top: 20),
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
        const Expanded(child: SizedBox()),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.9,
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
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
                  )),
              ElevatedButton(
                  onPressed: () {
                    this.txt_edit_controller.text += '0';
                  },
                  child: Text(
                    '0',
                    style: buttons_text_style,
                  )),
              ElevatedButton(
                onPressed: () {
                  if (this.txt_edit_controller.text != '') {
                    context.read<GameBloc>().add(GameEventSubmit(
                        int.parse(this.txt_edit_controller.text)));
                    this.txt_edit_controller.clear();
                  }
                },
                child: Icon(
                  Icons.clear,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GameFinishing extends StatelessWidget {
  const GameFinishing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your points ${game.points}',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              const SizedBox(
                height: 40,
              ),
              FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  context.read<GameBloc>().add(GameEventStart());
                },
                elevation: 0,
                label: const Text('Try again'),
                icon: const Icon(Icons.play_arrow),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  Navigator.pop(context);
                },
                label: const Text('back'),
                icon: const Icon(Icons.arrow_back),
                elevation: 0,
                backgroundColor: Theme.of(context).colorScheme.background,
                foregroundColor: Theme.of(context).colorScheme.onBackground,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class GameInit extends StatelessWidget {
  const GameInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  context.read<GameBloc>().add(GameEventStart());
                },
                elevation: 0,
                label: const Text('Start'),
                icon: const Icon(Icons.play_arrow),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  Navigator.pop(context);
                },
                label: const Text('back'),
                icon: const Icon(Icons.arrow_back),
                elevation: 0,
                backgroundColor: Theme.of(context).colorScheme.background,
                foregroundColor: Theme.of(context).colorScheme.onBackground,
              ),
            ],
          ),
        )
      ],
    );
  }
}
