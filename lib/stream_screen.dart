import 'dart:async';

import 'package:flutter/material.dart';

class MyStreamScreen extends StatefulWidget {
  const MyStreamScreen({super.key});

  @override
  State<MyStreamScreen> createState() => _MyStreamScreenState();
}

class _MyStreamScreenState extends State<MyStreamScreen> {
  final StreamController _streamController = StreamController();

  Stream get myStream => _streamController.stream;

  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;

    await for (final value in stream) {
      sum += value;
      print("value $value ,sum $sum");
    }
    return sum;
  }

  Stream<int> countStream(int to) async* {
    for (int i = 1; i <= to; i++) {
      yield i;
    }
  }

  void _calculate() async {
    var stream = countStream(10);
    var sum = await sumStream(stream);
    print(sum);
    _streamController.add(1014);
    _streamController.add(163641);

    ///print only when value is one
    // myStream.listen((value){
    //   print('mystream value: $value');
    // });

    ///print only when value are more than one
    // await for (final v in myStream) {
    //   print("value $v");
    // }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Example'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _calculate(),
            child: const Text('Click'),
          ),
        ],
      ),
    );
  }
}
