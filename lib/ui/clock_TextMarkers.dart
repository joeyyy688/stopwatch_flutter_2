import 'package:flutter/material.dart';
import 'dart:math';

class ClockTextMarkers extends StatelessWidget {
  final int value;
  final double radius;
  final int maxValue;
  const ClockTextMarkers(
      {Key? key,
      required this.value,
      required this.radius,
      required this.maxValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const width = 30.0;
    const height = 25.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        // this translates the text widgets (element) to the center of the clock
        ..translate(-width / 2, -height / 2, 0.0)
        // this rotates the text widgets (element) to the correct position
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        // this spreads the text widgets (element) out from the center of the clock to the edge
        ..translate(0.0, radius - 32, 0.0)
        // this repositions the text widgets (element) to fit the standard clock text
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        height: height,
        width: width,
        child: Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
