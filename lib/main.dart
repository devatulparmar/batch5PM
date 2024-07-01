import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // debugShowCheckedModeBanner: false,
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
            Text(
              'Hello',
            ),
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
        children: const [
          Text(
            'This is stateless classThis is stateless classThis is stateless classThis is stateless class',
            textAlign: TextAlign.start,
            overflow: TextOverflow.clip,
            style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.normal,
                wordSpacing: 1.5,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
