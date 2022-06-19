import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smct/blocs/game/game_bloc.dart';
import 'package:smct/blocs/selectedofflinetype/selectedofflinetype_cubit.dart';
import 'package:smct/models/game.dart';

class GameInitView extends StatelessWidget {
  const GameInitView(
      {Key? key, required this.offlineGameType, required this.gameMode})
      : super(key: key);

  final OfflineGameType offlineGameType;
  final Mode gameMode;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/${gameMode.name.toLowerCase()}.svg',
            width: 100,
            height: 100,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                heroTag: null,
                onPressed: () {
                  context.read<GameBloc>().add(GameEventStart());
                },
                elevation: 0,
                label: Text('Start'),
                icon: Icon(Icons.play_arrow),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
