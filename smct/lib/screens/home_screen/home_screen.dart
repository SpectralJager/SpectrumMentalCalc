import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/blocs/homenav/homenav_cubit.dart';
import 'package:smct/blocs/selectedofflinetype/selectedofflinetype_cubit.dart';
import 'package:smct/screens/home_screen/gameselect_view/gameselect_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeNavCubit()),
        BlocProvider(create: (_) => SelectedOfflineTypeCubit()),
      ],
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  final List<Widget> _home_item = [
    GameSelectView(),
    Container(
      key: const ValueKey(1),
      width: 300,
      height: 300,
      color: Colors.red,
    ),
    Container(
      key: const ValueKey(2),
      width: 300,
      height: 300,
      color: Colors.green,
    ),
  ];

  _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int current_index = context.select((HomeNavCubit _) => _.state);
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            _generateSideNavbar(context, current_index),
            Expanded(
              child: PageTransitionSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) =>
                        SharedAxisTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.vertical,
                  child: child,
                ),
                child: _home_item[current_index],
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
