import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smct/models/game.dart';
import 'package:smct/notifiers/survivemode.dart';
import 'package:smct/notifiers/timermode.dart';
import 'package:smct/views/hubview.dart';

void main() {
  runApp(const ProviderScope(child: MentalCalc()));
}

class MentalCalc extends StatelessWidget {
  const MentalCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HubView(),
      theme: ThemeData.from(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          // Primary
          primary: Color(0xffFFB77E),
          onPrimary: Color(0xff4F2500),
          primaryContainer: Color(0xff703800),
          onPrimaryContainer: Color(0xff),
          // Secondary
          secondary: Color(0xffE3BFA6),
          onSecondary: Color(0xff422B1A),
          secondaryContainer: Color(0xff5A412F),
          onSecondaryContainer: Color(0xffFFDCC2),
          // Tertiary
          tertiary: Color(0xffC6CA95),
          onTertiary: Color(0xff2F330B),
          tertiaryContainer: Color(0xff464A21),
          onTertiaryContainer: Color(0xffE3E7AF),
          // Error
          error: Color(0xffFFB4A9),
          onError: Color(0xff680003),
          errorContainer: Color(0xff930006),
          onErrorContainer: Color(0xffFFDAD4),
          // Background
          background: Color(0xff201A17),
          onBackground: Color(0xffECE0DA),
          surface: Color(0xff201A17),
          onSurface: Color(0xffECE0DA),
        ),
        useMaterial3: true,
        textTheme: TextTheme(
          headline1: GoogleFonts.oswald(),
        ),
      ),
    );
  }
}
