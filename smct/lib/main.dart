import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smct/models/game.dart';
import 'package:smct/notifiers/survivemode.dart';
import 'package:smct/notifiers/timermode.dart';
import 'package:smct/views/hubview.dart';

void main() {
  runApp(ProviderScope(child: const MentalCalc()));
}

class MentalCalc extends StatelessWidget {
  const MentalCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HubView(),
    );
  }
}
