import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Location location = Location();

  bool isServiceEnabled = false;
  late PermissionStatus permissionGranted;
  late LocationData _locationData;

  Future _getLocation() async {
    var obj = await location.getLocation();
    _locationData = obj;
    print(_locationData);
  }

  Future _checkLocationServiceEnable() async {
    /// this function will call to check location is On/Off

    isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        return;
      }
    }
  }

  Future _checkLocationPermissionGranted() async {
    /// this function will call to check user give permission to access location

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLocationServiceEnable().whenComplete(
      () => _checkLocationPermissionGranted(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _getLocation();
            },
            child: const Text('Get Location'),
          ),
          const Text('location: '),
        ],
      ),
    );
  }
}
