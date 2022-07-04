part of 'widgets.dart';

class ModeCard extends StatelessWidget {
  final int points;
  final int lvl;
  final String mode_anim;
  final Mode mode;
  final VoidCallback onTap;

  const ModeCard({
    Key? key,
    required this.mode_anim,
    required this.mode,
    required this.lvl,
    required this.points,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 5, bottom: 10),
      height: 260,
      width: 220,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(50),
              offset: Offset(4, 8),
              blurRadius: 4,
            ),
          ]),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  mode_anim,
                  width: 100,
                  height: 100,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  mode.name,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                SizedBox(
                  height: 10,
                ),
                Chip(
                  avatar: Icon(
                    Icons.extension,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  label: Text(
                    "MaxLVL: $lvl",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                SizedBox(
                  height: 10,
                ),
                Chip(
                  avatar: Icon(
                    Icons.score,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  label: Text(
                    "$points",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
          ),
          PlayBtn(
            on_tap: onTap,
          ),
          QuestionBtn()
        ],
      ),
    );
  }
}

class PlayBtn extends StatelessWidget {
  const PlayBtn({
    Key? key,
    required this.on_tap,
  }) : super(key: key);

  final void Function() on_tap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: on_tap,
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/svg/btn.svg",
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            Positioned(
              child: Icon(
                Icons.play_arrow,
                size: 40,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              bottom: 4,
              right: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionBtn extends StatelessWidget {
  const QuestionBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 10,
      child: FloatingActionButton.small(
        heroTag: null,
        child: Text(
          "?",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
      ),
    );
  }
}
