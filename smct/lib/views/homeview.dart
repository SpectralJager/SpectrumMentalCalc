import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:smct/models/game.dart';
import 'package:smct/widgets/modecard.dart';
import 'package:smct/widgets/playbtn.dart';
import 'package:smct/widgets/questionbtn.dart';
import 'package:smct/widgets/tabindicator.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tab_controller;
  @override
  void initState() {
    super.initState();
    this._tab_controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 80, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Offline modes",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            Container(
              height: 80,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  controller: this._tab_controller,
                  indicator: DotIndicator(
                    color: Theme.of(context).colorScheme.primary,
                    distanceFromCenter: 20,
                    radius: 4,
                  ),
                  tabs: [
                    Tab(
                      text: "Timer",
                    ),
                    Tab(
                      text: "Survive",
                    ),
                    Tab(
                      text: "Endurance",
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ModeCard(
                    mode: Mode.values[index],
                    mode_anim: "assets/anim/plus.json",
                    lvl: 8,
                    points: 30000,
                  );
                },
                itemCount: Mode.values.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
