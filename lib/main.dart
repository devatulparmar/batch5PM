import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
            Container(
              height: 100,
              width: 50,
              color: Colors.red,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 50,
                      color: Colors.red,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 100,
                      width: 50,
                      color: Colors.red,
                    ),
                  ],
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.red,
                ),
              ],
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.red,
                ),
              ],
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    ),
  );
}
