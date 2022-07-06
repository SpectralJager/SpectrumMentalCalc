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
      child: const _SelectGameView(),
    );
  }
}

class _SelectGameView extends StatelessWidget {
  const _SelectGameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.play_arrow),
        label: const Text('Start'),
        onPressed: () =>
            context.read<SelectGameBloc>().add(SubmitGameSettings(context)),
      ),
      body: Column(
        children: const [
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
