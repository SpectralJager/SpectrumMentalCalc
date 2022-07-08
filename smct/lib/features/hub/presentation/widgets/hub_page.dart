import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/features/hub/presentation/cubit/hub_cubit.dart';
import 'package:smct/features/hub/presentation/widgets/body.dart';
import 'package:smct/features/hub/presentation/widgets/sibebar.dart';

class HubPage extends StatelessWidget {
  const HubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => HubCubit(),
      child: const _HubView(),
    );
  }
}

class _HubView extends StatelessWidget {
  const _HubView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: const [
            HubSideBar(),
            HubBody(),
          ],
        ),
      ),
    );
  }
}
