import 'package:batch5pm/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isLogin = false;
  late SharedPreferences _preferences;

  Future initSharedPreferences() async{
    _preferences = await SharedPreferences.getInstance();
    isLogin = _preferences.getBool(prefLoginKey) ?? false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
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
                    // print('obj---> $obj');
                    // print('stackTrace--> $stackTrace');
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
            const Card(
              elevation: 10,
              child: ListTile(
                title: Text('About us'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Card(
              elevation: 10,
              child: ListTile(
                title: Text('Contact us'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(height: 20),
            isLogin
                ? Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Logout'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                      ),
                      onTap: () {
                        _preferences.remove(prefLoginKey);
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                  )
                : Card(
                    elevation: 10,
                    child: ListTile(
                      title: const Text('Login'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, routeLoginScreen);
                      },
                    ),
                  ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
