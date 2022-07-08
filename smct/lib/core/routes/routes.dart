import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/features/game/features/widgets/game_page.dart';
import 'package:smct/features/hub/presentation/widgets/hub_page.dart';

final routes = {
  '/': (ctx) => const HubPage(),
  '/game': (context) => const GamePage(),
};
