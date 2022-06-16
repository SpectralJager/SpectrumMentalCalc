<<<<<<< HEAD:smct/lib/bloc/game/game.dart
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gamemodel.dart';
part 'gamestate.dart';
part 'gameevent.dart';
part 'gamebloc.dart';

enum Mode {
  Summation,
  Subtraction,
  Multiplication,
  Division,
}
=======
import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smct/gameselect/gameselect.dart';

part 'gamemodel.dart';
part 'gameview.dart';
part 'gamestate.dart';
part 'gameevent.dart';
part 'gamebloc.dart';
part 'gamepage.dart';

enum Mode {
  Summation,
  Subtraction,
  Multiplication,
  Division,
}
>>>>>>> main:smct/lib/game/game.dart
