import 'package:batch5pm/screen2.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

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
                      radius: 50,
                      // maxRadius: 200,
                      // minRadius: 50,
                      backgroundColor: Colors.grey,
                      foregroundImage: const NetworkImage(imgNetwork),
                      onForegroundImageError:
                          (Object obj, StackTrace? stackTrace) {
                        //
                        //
                        // API call
                      },
                      onBackgroundImageError:
                          (Object obj, StackTrace? stackTrace) {
                        // API call
                      },
                    ),
                    const Text("Hello"),
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
              onTap: () {},
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
          CarouselSlider(
            carouselController: _controller,
            items: List.generate(
              items.length,
              (int index) => Image.network(items[index]),
            ),
            options: CarouselOptions(
              height: 280,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.ease,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, value) {
                setState(() {
                  _current = index;
                });
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              items.length,
              (int index) => GestureDetector(
                onTap: () => _controller.animateToPage(index),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        Colors.black.withOpacity(_current == index ? 1 : 0.4),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeMySegmentedButtonScreen);
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
            child: const Text('Segmented Button Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeClockScreen);
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
            child: const Text('Clock Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeMyStreamScreen);
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
            child: const Text('My Stream Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routeUserListScreen);
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
            child: const Text('User List Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, routePaginationListScreen);
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
            child: const Text('Pagination List Screen'),
          ),
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
