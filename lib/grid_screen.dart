import 'package:batch5pm/utils/const.dart';
import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {

  @override
  void initState() {
    super.initState();
    // _list = [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// GridView.extent
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Grid Screen'),
    //   ),
    //   body: GridView.extent(
    //     maxCrossAxisExtent: 100,
    //     crossAxisSpacing: 5,
    //     mainAxisSpacing: 5,
    //     // childAspectRatio: 0.5,
    //     scrollDirection: Axis.horizontal,
    //     children: [
    //       Container(
    //         // height: 100,
    //         // width: 100,
    //         color: Colors.red,
    //       ),
    //       Container(
    //         // height: 100,
    //         // width: 100,
    //         color: Colors.green,
    //       ),
    //       Container(
    //         height: 500.0,
    //         width: 100,
    //         color: Colors.yellow,
    //       ),
    //       Container(
    //         height: 100,
    //         width: 100,
    //         color: Colors.blue,
    //       ),
    //       Container(
    //         height: 100,
    //         width: 100,
    //         color: Colors.pink,
    //       ),
    //       Container(
    //         height: 100,
    //         width: 100,
    //         color: Colors.purple,
    //       ),
    //     ],
    //   ),
    // );

    /// GridView.builder
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Grid Screen'),
    //   ),
    //   body: GridView.builder(
    //     itemCount: 15,
    //     padding:const EdgeInsets.all(10),
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 3,
    //         crossAxisSpacing: 15,
    //         mainAxisSpacing: 15,
    //         childAspectRatio: 0.3,
    //     ),
    //     // scrollDirection: Axis.horizontal,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Container(
    //         color: Colors.yellow,
    //         child: Center(
    //           child: Text('$index'),
    //         ),
    //       );
    //     },
    //   ),
    // );

    /// GridView.count
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Screen'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.5,
        children: List.generate(15, (index) {
          return Card(
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 5,
            shadowColor: Colors.green,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: Image.network(
                    imgNetwork,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    // scale: 5.5,
                    // color: Colors.green,
                  ),
                ),
                Text('Hello'),
                Text('Hi'),
              ],
            ),
          );
        }),
      ),
    );
  }
}
