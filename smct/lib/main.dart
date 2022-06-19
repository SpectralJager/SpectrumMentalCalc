import 'package:flutter/material.dart';
import 'package:smct/config/theme.dart';
import 'package:smct/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MentalCalc());
}

class MentalCalc extends StatelessWidget {
  const MentalCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: HomeScreen(),
    );
  }
}
