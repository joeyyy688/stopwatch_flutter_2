import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';
import 'package:stopwatch_flutter/ui/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> with TickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _elapsedTime = Duration.zero;

  @override
  void initState() {
    // implement initState
    super.initState();
    _ticker = this.createTicker((elapsed) {
      setState(() {
        _elapsedTime = elapsed;
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    // implement dispose
    super.dispose();
    _ticker.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return StopwatchRenderer(
          elasped: _elapsedTime,
          radius: radius,
        );
      },
    );
  }
}
