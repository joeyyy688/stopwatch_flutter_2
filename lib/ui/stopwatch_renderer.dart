import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/clock_hand.dart';
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
        Transform(
          transform: Matrix4.identity(),
          child: Container(
            color: Colors.white,
          ),
        ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            handColor: Colors.orange,
            handLength: radius,
            handThickness: 2,
          ),
        )
        // ElapsedTimeText(
        //   elapsed: elasped,
        // )
      ],
    );
  }
}
