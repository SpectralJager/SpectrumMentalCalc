import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smct/blocs/selectedofflinetype/selectedofflinetype_cubit.dart';
import 'package:smct/models/game.dart';

class DotIndicator extends Decoration {
  final double radius;
  final Color color;
  final double distanceFromCenter;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  DotIndicator({
    this.paintingStyle = PaintingStyle.fill,
    this.radius = 3,
    this.color = Colors.blue,
    this.distanceFromCenter = 8,
    this.strokeWidth = 2,
  });
  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return new _CustomPainter(
      this,
      onChanged,
      radius,
      color,
      paintingStyle,
      distanceFromCenter,
      strokeWidth,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final DotIndicator decoration;
  final double radius;
  final Color color;
  final double distanceFromCenter;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  _CustomPainter(
    this.decoration,
    VoidCallback? onChanged,
    this.radius,
    this.color,
    this.paintingStyle,
    this.distanceFromCenter,
    this.strokeWidth,
  ) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    assert(strokeWidth >= 0 &&
        strokeWidth < configuration.size!.width / 2 &&
        strokeWidth < configuration.size!.height / 2);

    final Paint paint = Paint();
    double xAxisPos = offset.dx + configuration.size!.width / 2;
    double yAxisPos =
        offset.dy + configuration.size!.height / 2 + distanceFromCenter;
    paint.color = color;
    paint.style = paintingStyle;
    paint.strokeWidth = strokeWidth;
    canvas.drawCircle(Offset(xAxisPos, yAxisPos), radius, paint);
  }
}

class OfflineGameTypeTabBar extends StatefulWidget {
  OfflineGameTypeTabBar({
    Key? key,
  }) : super(key: key);

  @override
  State<OfflineGameTypeTabBar> createState() => _OfflineGameTypeTabBarState();
}

class _OfflineGameTypeTabBarState extends State<OfflineGameTypeTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tab_controller;

  @override
  void initState() {
    super.initState();

    this._tab_controller =
        TabController(length: OfflineGameType.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          isScrollable: true,
          controller: this._tab_controller
            ..addListener(
              () {
                print(1);
                context.read<SelectedOfflineTypeCubit>().changeOfflineType(
                    OfflineGameType.values[this._tab_controller.index]);
              },
            ),
          indicator: DotIndicator(
            color: Theme.of(context).colorScheme.primary,
            distanceFromCenter: 20,
            radius: 4,
          ),
          tabs: [
            for (var i in OfflineGameType.values)
              Tab(
                text: "${i.name}",
              ),
          ],
        ),
      ),
    );
  }
}

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
