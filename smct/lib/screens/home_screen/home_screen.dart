import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/blocs/homenav/homenav_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeNavCubit(),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int current_index =
        context.select((HomeNavCubit _) => _.state.current_index);
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            _generateSideNavbar(context, current_index),
            Expanded(
              child: Center(
                child: Text('selectedIndex: $current_index'),
              ),
            )
          ],
        ),
      ),
    );
  }

  NavigationRail _generateSideNavbar(BuildContext context, int current_index) {
    return NavigationRail(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      selectedLabelTextStyle: Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: Theme.of(context).colorScheme.onSecondary),
      minWidth: 64,
      elevation: 1,
      useIndicator: true,
      labelType: NavigationRailLabelType.none,
      selectedIndex: current_index,
      indicatorColor: Theme.of(context).colorScheme.onSecondary,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.secondary,
      ),
      onDestinationSelected: (new_index) =>
          context.read<HomeNavCubit>().changeIndex(new_index),
      leading: const SizedBox(
        height: 64,
      ),
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              radius: 25,
              child: Icon(
                Icons.people,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
      destinations: const [
        NavigationRailDestination(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Icon(Icons.home),
          ),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Icon(Icons.leaderboard),
          ),
          label: Text('Leaderboard'),
        ),
        NavigationRailDestination(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Icon(Icons.book),
          ),
          label: Text('Tutorials'),
        ),
      ],
    );
  }
}
