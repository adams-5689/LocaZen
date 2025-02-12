import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration gradientBoxDecoration = BoxDecoration(
      gradient: LinearGradient(
          colors: [Colors.pinkAccent, Colors.amber],
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(1, 0),
          stops: [0, 1],
          tileMode: TileMode.clamp));
}
