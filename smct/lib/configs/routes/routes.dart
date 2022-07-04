import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/modules/hub/cubit/navigation_rails_cubit.dart';
import 'package:smct/modules/hub/views/views.dart';

part 'arguments.dart';

final routes = {
  '/': (context) => BlocProvider(
        create: (context) => NavigationRailsCubit(),
        child: HubView(),
      ),
  // '/game': (context) => GameView(),
  // '/profile': (context) => ProfileView(),
};
