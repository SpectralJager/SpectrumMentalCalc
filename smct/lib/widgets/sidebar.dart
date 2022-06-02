import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/globalstate.dart';

class SideBar extends ConsumerWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current_page = ref.watch(hub_page_index);
    return Container(
      padding: EdgeInsets.only(top: 80),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * .15,
      color: Colors.grey,
      child: Column(
        children: [
          SideBarItem(
            icon: Icons.home,
            iconColor: current_page == 0 ? Colors.white : Colors.black,
            index: 0,
          ),
          SideBarItem(
            icon: Icons.leaderboard,
            iconColor: current_page == 1 ? Colors.white : Colors.black,
            index: 1,
          ),
          SideBarItem(
            icon: Icons.library_books,
            iconColor: current_page == 2 ? Colors.white : Colors.black,
            index: 2,
          ),
          Expanded(
              child: SizedBox(
            width: 1,
          )),
          SideBarItem(
            icon: Icons.people,
            iconColor: current_page == 3 ? Colors.white : Colors.black,
            index: 3,
          ),
        ],
      ),
    );
  }
}

class SideBarItem extends ConsumerWidget {
  const SideBarItem({
    Key? key,
    required this.index,
    required this.iconColor,
    required this.icon,
  }) : super(key: key);

  final int index;
  final Color iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: IconButton(
        onPressed: () => ref.read(hub_page_index.notifier).state = index,
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
