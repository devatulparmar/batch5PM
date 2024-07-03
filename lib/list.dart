import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 500,
            color: Colors.purple,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              padding:const EdgeInsets.all(15),
              reverse: true,
              // scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              // shrinkWrap: true,
              children: [
                Container(
                  height: 300,
                  width: 500,
                  color: Colors.red,
                ),
                Container(
                  height: 300,
                  width: 500,
                  color: Colors.green,
                ),
                Container(
                  height: 300,
                  width: 500,
                  color: Colors.blue,
                ),
                Container(
                  height: 300,
                  width: 500,
                  color: Colors.yellow,
                ),
                Container(
                  height: 300,
                  width: 500,
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            width: 500,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
