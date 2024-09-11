import 'package:batch5pm/screen2.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.pink.shade100,
              child: DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage(localImage),
                      radius: 60,
                      // maxRadius: 200,
                      // minRadius: 50,
                      backgroundColor: Colors.grey,
                      foregroundImage: const NetworkImage(imgNetwork),
                      onForegroundImageError:
                          (Object obj, StackTrace? stackTrace) {
                        // print('obj---> $obj');
                        // print('stackTrace--> $stackTrace');
                        // API call
                      },
                      onBackgroundImageError:
                          (Object obj, StackTrace? stackTrace) {
                        // API call
                      },
                    ),
                    Text("Hello"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, routeLoginScreen);
              },
              tileColor: Colors.blue,
              style: ListTileStyle.drawer,
              iconColor: Colors.white,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              selectedColor: Colors.white,
              selectedTileColor: Colors.red,
              selected: true,
              leading: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {},
              tileColor: Colors.blue,
              style: ListTileStyle.drawer,
              iconColor: Colors.white,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              selectedColor: Colors.white,
              selectedTileColor: Colors.red,
              selected: false,
              leading: const Icon(Icons.list),
              title: const Text('Orders'),
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, routeLoginScreen);
              },
              tileColor: Colors.blue,
              style: ListTileStyle.drawer,
              iconColor: Colors.white,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              selectedColor: Colors.white,
              selectedTileColor: Colors.red,
              selected: true,
              leading: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {},
              tileColor: Colors.blue,
              style: ListTileStyle.drawer,
              iconColor: Colors.white,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              selectedColor: Colors.white,
              selectedTileColor: Colors.red,
              selected: false,
              leading: const Icon(Icons.list),
              title: const Text('Orders'),
            ),
            const SizedBox(height: 10),
            ListTile(
              onTap: () {
              },
              tileColor: Colors.blue,
              style: ListTileStyle.drawer,
              iconColor: Colors.white,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              selectedColor: Colors.white,
              selectedTileColor: Colors.green,
              selected: false,
              leading: const Icon(Icons.list),
              title: const Text('List SCreen'),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeLocationScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
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
            child: const Text('Location'
                ' Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeRegisterScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
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
            child: const Text('Register Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeLoginScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
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

              Navigator.pushNamed(context, routeSalesScreen);

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
              backgroundColor: Colors.green,
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
            child: const Text('Sales Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeFoodScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
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
            child: const Text('Food Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeEmployeeListScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
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
            child: const Text('Employee List Screen'),
          ),
        ],
      ),
    );
  }
}
