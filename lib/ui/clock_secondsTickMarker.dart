import 'dart:math';
import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  final int seconds;
  final double radius;

  const ClockSecondsTickMarker(
      {Key? key, required this.seconds, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey.shade800;
    const tickerWidth = 2.0;
    const tickerHeight = 13.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-tickerWidth / 2, -tickerHeight / 2, 0.0)
        ..rotateZ(2 * pi * (seconds / 60.0))
        ..translate(0.0, radius - tickerHeight / 2, 0.0),
      child: Container(
        height: tickerHeight,
        width: tickerWidth,
        color: color,
      ),
    );
  }
}
