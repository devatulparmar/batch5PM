import 'package:batch5pm/screen2.dart';
import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/my_snackbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _launchUrl(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
    } else {
      MySnackBar.showMySnackBar(
          context: globalNavigationKey.currentContext!,
          content: 'Can not launch URL : $url');
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future _launchEmail(String email) async {
    var emailAddress = Uri(
      scheme: 'mailto',
      // queryParameters: {
      //   'subject': 'Hello',
      //   'body': 'Hi',
      // },
      path: email,
      // query: _encodeQueryParameters(
      //   {
      //     'subject': '',
      //     'body': '',
      //   },
      // ),
    );
    try {
      await launchUrl(emailAddress);
    } catch (e) {
      MySnackBar.showMySnackBar(
        context: globalNavigationKey.currentContext!,
        content: 'Could not launch $emailAddress',
        backgroundColor: Colors.red,
      );
    }
  }

  Future _launchSMS(String sms) async {
    var number = Uri(
      scheme: 'sms',
      path: '+91$sms',
      queryParameters: {
        'body': 'This is SMS Body',
      },
    );
    try {
      await launchUrl(number);
    } catch (e) {
      MySnackBar.showMySnackBar(
        context: globalNavigationKey.currentContext!,
        content: 'Could not launch $number',
        backgroundColor: Colors.red,
      );
    }
  }

  Future _launchPhone(String number) async {
    var phone = Uri(scheme: 'tel', path: '+91$number');
    try {
      await launchUrl(phone);
    } catch (e) {
      MySnackBar.showMySnackBar(
        context: globalNavigationKey.currentContext!,
        content: 'Could not launch $phone',
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       Container(
      //         color: Colors.pink.shade100,
      //         child: DrawerHeader(
      //           child: Column(
      //             children: [
      //               CircleAvatar(
      //                 backgroundImage: const AssetImage(localImage),
      //                 radius: 50,
      //                 // maxRadius: 200,
      //                 // minRadius: 50,
      //                 backgroundColor: Colors.grey,
      //                 foregroundImage: const NetworkImage(imgNetwork),
      //                 onForegroundImageError:
      //                     (Object obj, StackTrace? stackTrace) {
      //                   //
      //                   //
      //                   // API call
      //                 },
      //                 onBackgroundImageError:
      //                     (Object obj, StackTrace? stackTrace) {
      //                   // API call
      //                 },
      //               ),
      //               const Text("Hello"),
      //             ],
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       ListTile(
      //         onTap: () {
      //           Navigator.pushNamed(context, routeLoginScreen);
      //         },
      //         tileColor: Colors.blue,
      //         style: ListTileStyle.drawer,
      //         iconColor: Colors.white,
      //         textColor: Colors.white,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(35),
      //         ),
      //         selectedColor: Colors.white,
      //         selectedTileColor: Colors.red,
      //         selected: true,
      //         leading: const Icon(Icons.home),
      //         title: const Text('Home'),
      //       ),  const SizedBox(height: 10),
      //       ListTile(
      //         onTap: () {
      //           Navigator.pushNamed(context, routeLoginScreen);
      //         },
      //         tileColor: Colors.blue,
      //         style: ListTileStyle.drawer,
      //         iconColor: Colors.white,
      //         textColor: Colors.white,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(35),
      //         ),
      //         selectedColor: Colors.white,
      //         selectedTileColor: Colors.red,
      //         selected: true,
      //         leading: const Icon(Icons.home),
      //         title: const Text('Home'),
      //       ),
      //       const SizedBox(height: 10),
      //       ListTile(
      //         onTap: () {},
      //         tileColor: Colors.blue,
      //         style: ListTileStyle.drawer,
      //         iconColor: Colors.white,
      //         textColor: Colors.white,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(35),
      //         ),
      //         selectedColor: Colors.white,
      //         selectedTileColor: Colors.red,
      //         selected: false,
      //         leading: const Icon(Icons.list),
      //         title: const Text('Orders'),
      //       ),
      //       const SizedBox(height: 10),
      //       ListTile(
      //         onTap: () {
      //           Navigator.pushNamed(context, routeLoginScreen);
      //         },
      //         tileColor: Colors.blue,
      //         style: ListTileStyle.drawer,
      //         iconColor: Colors.white,
      //         textColor: Colors.white,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(35),
      //         ),
      //         selectedColor: Colors.white,
      //         selectedTileColor: Colors.red,
      //         selected: true,
      //         leading: const Icon(Icons.home),
      //         title: const Text('Home'),
      //       ),
      //       const SizedBox(height: 10),
      //       ListTile(
      //         onTap: () {},
      //         tileColor: Colors.blue,
      //         style: ListTileStyle.drawer,
      //         iconColor: Colors.white,
      //         textColor: Colors.white,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(35),
      //         ),
      //         selectedColor: Colors.white,
      //         selectedTileColor: Colors.red,
      //         selected: false,
      //         leading: const Icon(Icons.list),
      //         title: const Text('Orders'),
      //       ),
      //       const SizedBox(height: 10),
      //       ListTile(
      //         onTap: () {},
      //         tileColor: Colors.blue,
      //         style: ListTileStyle.drawer,
      //         iconColor: Colors.white,
      //         textColor: Colors.white,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(35),
      //         ),
      //         selectedColor: Colors.white,
      //         selectedTileColor: Colors.green,
      //         selected: false,
      //         leading: const Icon(Icons.list),
      //         title: const Text('List SCreen'),
      //       ),
      //     ],
      //   ),
      // ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage(imgNetwork),
                fit: BoxFit.cover,
                opacity: 0.3,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // Opacity(
          //   opacity: 0.3,
          //   child: Image.network(
          //     imgNetwork,
          //     height: MediaQuery.of(context).size.height,
          //     width: MediaQuery.of(context).size.width,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          ListView(
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
                        color: Colors.black
                            .withOpacity(_current == index ? 1 : 0.4),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _launchPhone("909000000000");
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
                child: const Text('Call Us on Number'),
              ),
              ElevatedButton(
                onPressed: () {
                  _launchSMS("909000000000");
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
                child: const Text('Contact Us on Number'),
              ),
              ElevatedButton(
                onPressed: () {
                  _launchEmail('info@mayursoftware.in');
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
                child: const Text('Contact Us'),
              ),
              ElevatedButton(
                onPressed: () {
                  _launchUrl('https://flutter.dev');
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
                child: const Text('Privacy Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, routeSearchScreen);
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
                child: const Text('Search Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, routeVideoScreen);
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
                child: const Text('Video Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, routeGoogleMapScreen);
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
                child: const Text('Google Maps Screen'),
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
        ],
      ),
    );
  }
}
