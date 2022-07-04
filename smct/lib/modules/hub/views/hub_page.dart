part of 'views.dart';

class HubPage extends StatelessWidget {
  HubPage({Key? key}) : super(key: key);

  final List<Widget> _homeItem = [
    Container(
      key: const ValueKey(0),
      width: 300,
      height: 300,
      color: Colors.purple,
    ),
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

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<NavigationRailsCubit>().state;
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            _sideNavbar(context, currentIndex),
            _mainBody(currentIndex)
          ],
        ),
      ),
    );
  }

  Expanded _mainBody(int currentIndex) {
    return Expanded(
      child: PageTransitionSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.vertical,
          child: child,
        ),
        child: _homeItem[currentIndex],
      ),
    );
  }

  NavigationRail _sideNavbar(BuildContext context, int currentIndex) {
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
      selectedIndex: currentIndex,
      indicatorColor: Theme.of(context).colorScheme.onSecondary,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.secondary,
      ),
      onDestinationSelected: (newIndex) =>
          context.read<NavigationRailsCubit>().changeHubView(newIndex),
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
