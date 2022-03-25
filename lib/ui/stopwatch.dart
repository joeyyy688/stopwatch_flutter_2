import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/reset_button.dart';
import 'package:stopwatch_flutter/ui/start_stop_button.dart';
import 'package:stopwatch_flutter/ui/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> with TickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _previousElapsed = Duration.zero;
  Duration _currentElapsed = Duration.zero;
  bool isRunning = false;
  Duration get _elapsedTime => _currentElapsed + _previousElapsed;

  @override
  void initState() {
    // implement initState
    super.initState();
    _ticker = this.createTicker((elapsed) {
      setState(() {
        _currentElapsed = elapsed;
      });
    });
  }

  @override
  void dispose() {
    // implement dispose
    super.dispose();
    _ticker.dispose();
  }

  void toggleRunning() {
    setState(() {
      isRunning = !isRunning;
    });

    if (isRunning) {
      _ticker.start();
    } else {
      // if the _ticker.stop() method is called the _ticker's elapsed time is cleared
      _ticker.stop();
      // so we need to save the previous elapsed time after the _ticker.stop() method is called by adding the current elapsed time to the previous elapsed time
      // then setting the current elapsed time to zero
      _previousElapsed += _currentElapsed;
      _currentElapsed = Duration.zero;

      // so whenever we hit the start button again the previous elapsed time is added to the current elapsed time and the timer continues from where it left off
    }
  }

  void reset() {
    _ticker.stop();

    setState(() {
      isRunning = false;
      _previousElapsed = Duration.zero;
      _currentElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopwatchRenderer(
              elasped: _elapsedTime,
              radius: radius,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 80,
                width: 80,
                child: ResetButton(
                  onPressed: reset,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 80,
                width: 80,
                child: StartStopButton(
                  isRunning: isRunning,
                  onPressed: toggleRunning,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
