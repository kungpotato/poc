import 'dart:async';

import 'package:flutter/material.dart';

class CountdownText extends StatefulWidget {
  const CountdownText({
    required this.countdownSeconds,
    required this.onComplete,
    super.key,
  });

  final int countdownSeconds;
  final VoidCallback onComplete;

  @override
  CountdownTextState createState() => CountdownTextState();
}

class CountdownTextState extends State<CountdownText> {
  late int _countdown;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _countdown = widget.countdownSeconds;
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() => _countdown--);
      } else {
        timer.cancel();
        widget.onComplete();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_countdown sec');
  }
}
