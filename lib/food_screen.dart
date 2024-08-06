import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Screen'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              cursorColor: Colors.blue,
              cursorWidth: 2,
              cursorHeight: 15,
              cursorRadius: const Radius.circular(35),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onChanged: (String? value) {},
              onTapOutside: (PointerDownEvent p) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                labelText: "",
                labelStyle: const TextStyle(
                  color: Colors.blue,
                ),
                prefixIcon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.blue,
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.clear,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 35,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.black54,
                      ),
                    ),
                    Icon(
                      Icons.mic,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text('Restaurants'),
              Text('Dishes'),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 65,
            child: ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: const [
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://images.ctfassets.net/nw5k25xfqsik/64VwvKFqxMWQORE10Tn8pY/200c0538099dc4d1cf62fd07ce59c2af/20220211142754-margherita-9920.jpg'),
                      ),
                      SizedBox(height: 5),
                      Text('Pizza')
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 35,
            child: ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text('Near and Fast'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Flexible(child: Text('ALL RESTAURANTS DELIVERING CHEESE PIZZA')),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
            itemCount: 15,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      // ClipRRect(
                      //   borderRadius: const BorderRadius.only(
                      //     topRight: Radius.circular(20),
                      //     topLeft: Radius.circular(20),
                      //   ),
                      //   child: Stack(
                      //     children: [
                      //       Image.network(
                      //         imgNetwork,
                      //         height: 150,
                      //         width: MediaQuery.of(context).size.width,
                      //         fit: BoxFit.fitWidth,
                      //       ),
                      //       Positioned(
                      //         top: 5,
                      //         left: 20,
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //             color: Colors.black38,
                      //             borderRadius: BorderRadius.circular(5),
                      //           ),
                      //           child: const Padding(
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 10, vertical: 5),
                      //             child: Text(
                      //               'Margherita Pizza - 139\$',
                      //               style: TextStyle(
                      //                 fontSize: 12,
                      //                 fontWeight: FontWeight.normal,
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       const Positioned(
                      //         right: 20,
                      //         top: 5,
                      //         child: Icon(
                      //           Icons.favorite_border,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            image: NetworkImage('https://images.ctfassets.net/nw5k25xfqsik/64VwvKFqxMWQORE10Tn8pY/200c0538099dc4d1cf62fd07ce59c2af/20220211142754-margherita-9920.jpg'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Text(
                                        'Margherita Pizza - 139\$',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'La Pinoz Pizza',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Text('5.0 ★'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Pure Veg - Pizza = \$200 for one',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
