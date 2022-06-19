import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/blocs/selectedofflinetype/selectedofflinetype_cubit.dart';
import 'package:smct/models/game.dart';
import 'package:smct/screens/game_screen/gamescreen.dart';

import 'widgets.dart';

class GameSelectView extends StatelessWidget {
  GameSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Offline modes",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            OfflineGameTypeTabBar(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  var mode = Mode.values[index];
                  return Builder(builder: (context) {
                    var offlineGameType = context.select(
                      (SelectedOfflineTypeCubit _) => _.state,
                    );
                    return OpenContainer(
                      closedColor: Colors.transparent,
                      tappable: false,
                      middleColor: Theme.of(context).colorScheme.background,
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: const Duration(milliseconds: 700),
                      closedElevation: 0,
                      closedBuilder: (context, openContainer) {
                        return ModeCard(
                          mode_anim:
                              'assets/svg/${mode.name.toLowerCase()}.svg',
                          lvl: 1,
                          points: 1,
                          mode: mode,
                          onTap: openContainer,
                        );
                      },
                      openBuilder: (context, openContainer) {
                        return GameScreen(
                          gameMode: Mode.values[index],
                          offlineGameType: offlineGameType,
                        );
                      },
                    );
                  });
                },
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
