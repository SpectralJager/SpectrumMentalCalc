import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/features/select_game/presentation/bloc/select_game_bloc.dart';

import 'body.dart';
import 'header.dart';

class SelectGamePage extends StatelessWidget {
  const SelectGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => SelectGameBloc(),
      child: _SelectGameView(),
    );
  }
}

class _SelectGameView extends StatelessWidget {
  const _SelectGameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.play_arrow),
        label: Text('Start'),
        onPressed: () =>
            context.read<SelectGameBloc>().add(SubmitGameSettings()),
      ),
      body: Column(
        children: [
          Header(),
          Divider(
            color: Colors.red,
          ),
          Body(),
          Divider(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
