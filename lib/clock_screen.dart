import 'dart:async';

import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  int _countSeconds = 0;
  Timer? _stopWatchTimer;
  bool _isRunning = false;

  Timer? _timer;
  int countDownValue = 30;

  void _startTimer() {
    try {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer t) {
          if (countDownValue == 0) {
            _timer!.cancel();
          } else {
            countDownValue--;
          }
          setState(() {});
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  void _resetTimer() {
    countDownValue = 30;
    setState(() {});
  }

  void _startStopWatchTimer() {
    _isRunning = true;
    _stopWatchTimer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) {
        setState(() {
          _countSeconds++;
        });
      },
    );
  }

  void _stopStopWatch() {
    _isRunning = false;
    if (_stopWatchTimer != null) {
      _stopWatchTimer?.cancel();
    }
  }

  void _resetStopWatch() {
    _stopStopWatch();
    setState(() {
      _countSeconds = 0;
    });
  }

  _formatDuration(int seconds) {
    final int hours = seconds ~/ 3600;
    final int minutes = (seconds % 3600) ~/ 60;
    final int secs = seconds % 60;

    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _stopTimer();
    _stopStopWatch();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              _formatDuration(_countSeconds),
              style: const TextStyle(fontSize: 48),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _isRunning ? null : _startStopWatchTimer,
                child: const Text('Start'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _isRunning ? _stopStopWatch : null,
                child: const Text('Stop'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _resetStopWatch,
                child: const Text('Reset'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.black),
          const SizedBox(height: 50),
          Center(child: Text('Count Down Time: $countDownValue')),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _startTimer();
                },
                child: const Text('Start'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _stopTimer,
                child: const Text('Stop'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  _resetTimer();
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
