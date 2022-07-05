import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/features/hub/presentation/cubit/hub_cubit.dart';

class HubSideBar extends StatelessWidget {
  const HubSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      selectedIndex: context.watch<HubCubit>().state,
      indicatorColor: Theme.of(context).colorScheme.onSecondary,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.secondary,
      ),
      onDestinationSelected: (newIndex) =>
          context.read<HubCubit>().changeIndex(newIndex),
      leading: const SizedBox(
        height: 64,
      ),
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FloatingActionButton.small(
              heroTag: null,
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              child: Icon(
                Icons.people,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {},
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
