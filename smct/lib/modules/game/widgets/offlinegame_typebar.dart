part of 'widgets.dart';

class OfflineGameTypeTabBar extends StatefulWidget {
  OfflineGameTypeTabBar({
    Key? key,
  }) : super(key: key);

  @override
  State<OfflineGameTypeTabBar> createState() => _OfflineGameTypeTabBarState();
}

class _OfflineGameTypeTabBarState extends State<OfflineGameTypeTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tab_controller;

  @override
  void initState() {
    super.initState();

    this._tab_controller =
        TabController(length: OfflineGameType.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          isScrollable: true,
          controller: this._tab_controller
            ..addListener(
              () {
                context.read<OfflineGameTypeCubit>().changeOfflineType(
                    OfflineGameType.values[this._tab_controller.index]);
              },
            ),
          indicator: DotIndicator(
            color: Theme.of(context).colorScheme.primary,
            distanceFromCenter: 20,
            radius: 4,
          ),
          tabs: [
            for (var i in OfflineGameType.values)
              Tab(
                text: "${i.name}",
              ),
          ],
        ),
      ),
    );
  }
}
