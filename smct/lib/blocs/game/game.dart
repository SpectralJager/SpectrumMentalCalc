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
