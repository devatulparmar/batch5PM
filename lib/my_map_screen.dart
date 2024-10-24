import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;
  final String googleAPiKey = "AIzaSyBag7tEPSRavJboDAIBQyOv8_R3zB3dQNE";
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  var _originLatitude = 22.3091724, _originLongitude = 73.1710888;
  var _destLatitude = 23.0204741, _destLongitude = 72.4149272;

  Location location = Location();
  PolylinePoints polylinePoints = PolylinePoints();

  bool isServiceEnabled = false;
  late PermissionStatus permissionGranted;

  void addMarkerToMap(
      {required LatLng position,
      required String id,
      required BitmapDescriptor descriptor}) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: descriptor,
      position: position,
    );
    markers[markerId] = marker;
    setState(() {});
  }

  void addPolyLinesToMap() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  Future _getPolyline() async {
    PolylineResult resultPoly = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: googleAPiKey,
      request: PolylineRequest(
        origin: PointLatLng(_originLatitude, _originLongitude),
        destination: PointLatLng(_destLatitude, _destLongitude),
        mode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Vadodara")],
      ),
    );
    print(resultPoly.points);
    if (resultPoly.points.isNotEmpty) {
      for (var point in resultPoly.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    addPolyLinesToMap();
  }

  Future _getLocation() async {
    if (permissionGranted == PermissionStatus.deniedForever) {
      AppSettings.openAppSettings(type: AppSettingsType.appLocale);
    } else {
      LocationData locationData = await location.getLocation();
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              locationData.latitude ?? 0.0,
              locationData.longitude ?? 0.0,
            ),
            zoom: 20,
          ),
        ),
      );
    }
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

    /// origin marker
    addMarkerToMap(
      id: "origin",
      position: LatLng(_originLatitude, _originLongitude),
      descriptor: BitmapDescriptor.defaultMarker,
    );

    /// destination marker
    addMarkerToMap(
      id: "destination",
      position: LatLng(_destLatitude, _destLongitude),
      descriptor: BitmapDescriptor.defaultMarker,
    );

    _getPolyline();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        padding: const EdgeInsets.all(10),
        style: "This is Map Style",
        buildingsEnabled: false,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        trafficEnabled: false,
        scrollGesturesEnabled: true,
        rotateGesturesEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        fortyFiveDegreeImageryEnabled: true,
        // indoorViewEnabled: false,
        liteModeEnabled: false,
        mapToolbarEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: false,
        initialCameraPosition: const CameraPosition(
          target: LatLng(22.31089546534487, 73.18461913615465),
          zoom: 11,
        ),
        // onTap: (LatLng latLongValue) {
        //   debugPrint('on tap lat long is : $latLongValue');
        // },
        // onLongPress: (LatLng latLongValue) {
        //   debugPrint('onLongPress lat long is : $latLongValue');
        // },
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          setState(() {});
        },
        markers: Set.of(markers.values),
        polylines: Set<Polyline>.of(polylines.values),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _getLocation,
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
