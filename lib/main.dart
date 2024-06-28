import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyStatelessScreen(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
          centerTitle: false,
          backgroundColor: const Color(0XFFF8BBD0),
          leading: const Icon(Icons.arrow_back),
          actions: const [
            Icon(Icons.refresh),
            Text('Hello'),
            Icon(Icons.person),
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            Center(
              child: Text('Clicked $count times'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            count = count + 1;
            setState(() {});
            print('Clicked');
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}

class MyStatelessScreen extends StatelessWidget {
  const MyStatelessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('This is stateless class'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('clicked stateless');
        },
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
