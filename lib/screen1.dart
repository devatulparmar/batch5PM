import 'package:batch5pm/screen2.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
        // leading: BackButton(
        //   onPressed: () {},
        //   color: Colors.red,
        // ),
        actions: [
          CloseButton(
            onPressed: () {},
            color: Colors.red,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeLoginScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              elevation: 5,
              alignment: Alignment.centerLeft,
              // fixedSize: Size(20, 35)
              shadowColor: Colors.green,
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: const Text('Login Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => const Screen2(),
              //   ),
              // );

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => const Screen2(),
              //   ),
              // );

              // Navigator.pop(context);

              Navigator.pushNamed(context, routeScreen2);

              // Navigator.pushReplacementNamed(context, routeScreen2);

              // Navigator.pushNamedAndRemoveUntil(
              //   context,
              //   routeScreen2,
              //   (Route r) {
              //     return false;
              //   },
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              elevation: 5,
              alignment: Alignment.centerLeft,
              // fixedSize: Size(20, 35)
              shadowColor: Colors.green,
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: const Text('Go to Next Screen'),
          ),
          TextButton(
            onPressed: () {},
            onLongPress: () {
              print('long press');
            },
            child: const Text(
              'Click here',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
