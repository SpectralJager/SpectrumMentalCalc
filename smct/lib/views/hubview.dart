import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/widgets/sidebar.dart';

class HubView extends ConsumerStatefulWidget {
  const HubView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HubViewState();
}

class _HubViewState extends ConsumerState<HubView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          SideBar(),
          SizedBox(
            width: MediaQuery.of(context).size.width * .85,
            height: MediaQuery.of(context).size.height,
            child: PageView(
              scrollDirection: Axis.vertical,
              children: [
                Center(
                  child: Text("1"),
                ),
                Center(
                  child: Text("2"),
                ),
                Center(
                  child: Text("3"),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
