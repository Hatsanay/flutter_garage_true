import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_garage_true/constans.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class OrderTrackingPage extends StatefulWidget {
  final Map<String, dynamic> garage;
  final String username;

  final String id;

  final String proflie;

  final String garagelattitude;
  final String garagelonggitude;
  OrderTrackingPage(
      {Key? key,
      required this.garage,
      required String title,
      required this.username,
      required this.proflie,
      required this.garagelattitude,
      required this.garagelonggitude,
      required this.id})
      : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late double lat2, lng2;

  static const LatLng sourceLocation = LatLng(8.10271, 98.892);
  LatLng destination = LatLng(8.08548, 98.9063);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            zoom: 16.5,
            target: LatLng(
              newLoc.latitude!,
              newLoc.longitude!,
            )),
      ));
      setState(() {});
    });
  }

  Future<Null> findlatlng1() async {
    setState(() {
      lat2 = double.parse(widget.garage['repairreqlattitude']);
      lng2 = double.parse(widget.garage['repairreqlonggitude']);
      // latti1 = lat1 as String;
      // lngji1 = lng1 as String;
    });
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/icons/Pin_source.png")
        .then(
      (icon) {
        sourceIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/icons/Pin_destination.png")
        .then(
      (icon) {
        destinationIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/icons/Badge.png")
        .then(
      (icon) {
        currentLocationIcon = icon;
      },
    );
  }

  void getPolypoint() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      // PointLatLng(destination.latitude,destination.longitude),
      PointLatLng(lat2, lng2),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    findlatlng1();
    getCurrentLocation();
    setCustomMarkerIcon();
    getPolypoint();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? Center(
              child: Text("Loading"),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    currentLocation!.latitude!, currentLocation!.longitude!),
                zoom: 16.5,
              ),
              polylines: {
                Polyline(
                  polylineId: PolylineId("rount"),
                  points: polylineCoordinates,
                  color: Colors.blue,
                  width: 6,
                ),
              },
              markers: {
                Marker(
                  markerId: const MarkerId("currentLocation"),
                  icon: currentLocationIcon,
                  position: LatLng(
                    currentLocation!.latitude!,
                    currentLocation!.longitude!,
                  ),
                ),
                // Marker(
                //   markerId: MarkerId("source"),
                //   icon: sourceIcon,
                //   position: sourceLocation,
                // ),
                Marker(
                  markerId: MarkerId("destination"),
                  icon: destinationIcon,
                  // position: destination,

                  position: LatLng(lat2, lng2),
                ),
              },
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
            ),
    );
  }
}
