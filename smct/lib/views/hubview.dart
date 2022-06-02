import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/globalstate.dart';
import 'package:smct/views/homeview.dart';
import 'package:smct/widgets/sidebar.dart';

class HubView extends ConsumerStatefulWidget {
  const HubView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HubViewState();
}

class _HubViewState extends ConsumerState<HubView> {
  final hub_pages = [
    HomeView(),
    Center(
      child: Text('leaderboard'),
    ),
    Center(
      child: Text('tutorials'),
    ),
    Center(
      child: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final current_page = ref.watch(hub_page_index);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(children: [
            SideBar(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .85,
              height: MediaQuery.of(context).size.height,
              child: hub_pages[current_page],
            )
          ]),
        ),
      ),
    );
  }
}
