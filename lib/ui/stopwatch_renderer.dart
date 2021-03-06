import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/clock_TextMarkers.dart';
import 'package:stopwatch_flutter/ui/clock_hand.dart';
import 'package:stopwatch_flutter/ui/clock_secondsTickMarker.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  final Duration elasped;
  final double radius;

  const StopwatchRenderer(
      {Key? key, required this.elasped, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //       border: Border.all(
        //         width: 3,
        //         color: Colors.orange,
        //       ),
        //       shape: BoxShape.circle),
        // ),
        for (var i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarker(
              seconds: i,
              radius: radius,
            ),
          ),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
            left: radius,
            top: radius,
            child: ClockTextMarkers(
              maxValue: 60,
              value: i,
              radius: radius,
            ),
          ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            handColor: Colors.orange,
            handLength: radius,
            handThickness: 1.5,
            rotationZAngle: pi + (2 * pi / 60000) * elasped.inMilliseconds,
            //rotationZAngle: elasped.inSeconds / 60 * pi / 2,
            //rotationZAngle: elasped.inMilliseconds / 10000,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 0.2,
          bottom: 0,
          child: ElapsedTimeText(
            elapsed: elasped,
          ),
        )
      ],
    );
  }
}
