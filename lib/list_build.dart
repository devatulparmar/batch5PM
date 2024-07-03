import 'package:flutter/material.dart';

class ListBuildScreen extends StatefulWidget {
  const ListBuildScreen({Key? key}) : super(key: key);

  @override
  State<ListBuildScreen> createState() => _ListBuildScreenState();
}

class _ListBuildScreenState extends State<ListBuildScreen> {
  List _list = [
    "Vadodara",
    "Ahmedabad",
    "Surat",
    "Gandhi Nagar",
    "Rajkot",
    "Katchh",
    55
  ];

  List _newList = [
    44,
    33,
    22,
    11
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Builder Screen'),
        actions: [
          IconButton(
            onPressed: () {
              _list.clear();
              setState(() {});
            },
            icon:const Icon(Icons.clear),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: _list.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            thickness: 5,
            color: Colors.pink,
            indent: 15,
            endIndent: 15,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 300,
            width: 500,
            color: Colors.blue,
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _list[index].toString(),
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _list.removeAt(index);
                    // _list.remove(_list[index].toString());
                    setState(() {});
                  },
                  icon:const Icon(Icons.delete, color: Colors.red,),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _list.add(44);
          print(_list.contains(55));
          setState(() {});
        },
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.add,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Builder Screen'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemExtent: 500,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 300,
            width: 500,
            color: Colors.blue,
            margin: const EdgeInsets.all(15),
            child: Text(
              "Index is $index",
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          );
        },
      ),
    );
  }
}
