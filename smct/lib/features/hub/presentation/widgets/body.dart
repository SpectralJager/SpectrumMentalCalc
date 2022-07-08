import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/features/hub/presentation/cubit/hub_cubit.dart';

class HubBody extends StatelessWidget {
  const HubBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: context.watch<HubCubit>().currentHubPage,
      ),
    );
  }
}
