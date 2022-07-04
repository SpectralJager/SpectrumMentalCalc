part of 'views.dart';

class SelectGameView extends StatelessWidget {
  const SelectGameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OfflineGameTypeCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Offline modes",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
              OfflineGameTypeTabBar(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    var mode = Mode.values[index];
                    return ModeCard(
                      mode_anim: 'assets/svg/${mode.name.toLowerCase()}.svg',
                      lvl: 1,
                      points: 1,
                      mode: mode,
                      onTap: () {},
                    );
                  },
                  itemCount: 4,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
