import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/blocs/game/game_bloc.dart';

class GameFinishView extends StatelessWidget {
  const GameFinishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var game = context.select((GameBloc bloc) => bloc.state.game);
    return Column(
      children: [
        Container(
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
              SizedBox(
                height: 40,
              ),
              FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  context.read<GameBloc>().add(GameEventStart());
                },
                elevation: 0,
                label: Text('Try again'),
                icon: Icon(Icons.play_arrow),
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  Navigator.pop(context);
                },
                label: Text('back'),
                icon: Icon(Icons.arrow_back),
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
