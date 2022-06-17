// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/blocs/home/home.dart';
import 'package:smct/views/gameselectview.dart';
import 'package:smct/views/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final hub_pages = [
    const GameSelectView(),
    const Center(
      child: Text('leaderboard'),
    ),
    const Center(
      child: Text('tutorials'),
    ),
    const Center(
      child: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            const SideBar(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .85,
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return this.hub_pages[state.current_view];
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
