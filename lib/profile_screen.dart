import 'package:batch5pm/utils/const.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(155),
                border: Border.all(color: Colors.purple, width: 5),
              ),
              child: CircleAvatar(
                backgroundImage: const AssetImage(localImage),
                radius: 100,
                // maxRadius: 200,
                // minRadius: 50,
                backgroundColor: Colors.grey,

                foregroundImage: const NetworkImage(imgNetwork),
                onForegroundImageError: (Object obj, StackTrace? stackTrace) {
                  //
                  //
                  // API call
                },
                onBackgroundImageError: (Object obj, StackTrace? stackTrace) {
                  // API call
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgNetwork),
                onError: (Object obj, StackTrace? stackTrace) {
                  // API call
                },
              ),
              borderRadius: BorderRadius.circular(155),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(155),
            child:const Image(
              height: 200,
              width: 200,
              image: NetworkImage(imgNetwork),
            ),
          ),
        ],
      ),
    );
  }
}
