import 'package:batch5pm/assets_example.dart';
import 'package:batch5pm/grid_screen.dart';
import 'package:batch5pm/list.dart';
import 'package:batch5pm/list_build.dart';
import 'package:batch5pm/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    ),
  );
}

//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   int count = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("My App"),
//           centerTitle: false,
//           backgroundColor: const Color(0XFFF8BBD0),
//           leading: const Icon(Icons.arrow_back),
//           actions: const [
//             Icon(Icons.refresh),
//             Text(
//               'Hello',
//             ),
//             Icon(Icons.person),
//           ],
//           elevation: 0,
//         ),
//         body: Column(
//           children: [
//             Center(
//               child: Text('Clicked $count times'),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             count = count + 1;
//             setState(() {});
//           },
//           child: const Icon(
//             Icons.add,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MyStatelessScreen extends StatelessWidget {
//   const MyStatelessScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 color: Colors.red,
//               ),
//               Expanded(
//                 flex: 6,
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.green,
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.yellow,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 50,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Flexible(
//                 flex: 1,
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.purple,
//                 ),
//               ),
//               Flexible(
//                 flex: 6,
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.blue,
//                 ),
//               ),
//               Flexible(
//                 flex: 2,
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.orange,
//                 ),
//               ),
//             ],
//           ),
//
//
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {},
//       //   child: Icon(
//       //     Icons.add,
//       //   ),
//       // ),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
//     );
//   }
// }