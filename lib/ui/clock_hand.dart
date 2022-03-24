import 'package:flutter/widgets.dart';

class ClockHand extends StatelessWidget {
  final double handThickness;
  final double handLength;
  final Color handColor;
  final double rotationZAngle;
  const ClockHand(
      {Key? key,
      required this.handThickness,
      required this.handLength,
      required this.handColor,
      required this.rotationZAngle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateZ(rotationZAngle),
      // transform: Matrix4.identity()
      //   ..translate(-handThickness / 2, 0.0, 0.0)
      //   ..rotateZ(0),
      child: Container(
        width: handThickness,
        height: handLength,
        color: handColor,
      ),
    );
  }
}
