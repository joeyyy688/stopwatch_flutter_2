import 'package:flutter/widgets.dart';

class ClockHand extends StatelessWidget {
  final double handThickness;
  final double handLength;
  final Color handColor;
  final double
  const ClockHand(
      {Key? key,
      required this.handThickness,
      required this.handLength,
      required this.handColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateY(ra),
      child: Container(
        width: handThickness,
        height: handLength,
        color: handColor,
      ),
    );
  }
}
