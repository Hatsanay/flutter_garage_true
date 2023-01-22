import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity/connectivity.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(8.0878723, -98.9061776);
  Set<Marker> _markers = Set();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _getMarkersFromDB();
  }

  _getMarkersFromDB() async {
    var url = 'http://192.168.1.101/flutter_login/getmapgarage.php';
    var response = await http.get(Uri.parse(url));
    var markers = jsonDecode(response.body);
    for (var marker in markers) {
      _markers.add(Marker(
        markerId: MarkerId(marker['garageid']),
        position: LatLng(double.parse(marker['latitude']),
            double.parse(marker['longitude'])),
        // position: LatLng(8.0878723, 98.9061776),
        infoWindow: InfoWindow(
          title: marker['garagename'],
          snippet: marker['address'],
        ),
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      // myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(8.0878723, 98.9061776),
        zoom: 12.0,
      ),
      markers: _markers,
    );
  }
}

// class MapSample extends StatefulWidget {
//   @override
//   _MapSampleState createState() => _MapSampleState();
// }

// class _MapSampleState extends State<MapSample> {
//   late GoogleMapController mapController;
//   final LatLng _center = const LatLng(8.0878723, -98.9061776);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       onMapCreated: _onMapCreated,
//       initialCameraPosition: CameraPosition(
//         target: LatLng(8.0878723, 98.9061776),
//         zoom: 11.0,
//       ),
//       markers: {
//         Marker(
//           markerId: MarkerId("1"),
//           position: LatLng(8.0878723, 98.9061776),
//           infoWindow: InfoWindow(
//             title: "Marker Title",
//             snippet: "Marker Description",
//           ),
//         ),
//       },
//     );
//   }
// }









// class MapSample extends StatefulWidget {
//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   Completer<GoogleMapController> _controller = Completer();
//   Set<Marker> markers = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchMarkers().then((value) {
//       setState(() {
//         markers = value;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(8.0878723, 98.9061776),
//           zoom: 14.4746,
//         ),
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//         markers: markers,
//       ),
//     );
//   }

//   fetchMarkers() async {
//     var url = 'http://192.168.1.101/flutter_login/getmapgarage.php';
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       var response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200 && response.body.isNotEmpty) {
//         List markers = json.decode(response.body);
//         List<Marker> markersList = [];
//         for (var marker in markers) {
//           markersList.add(Marker(
//             markerId: MarkerId(marker['garageid'].toString()),
//             position:
//                 LatLng(marker['garagelattitude'], marker['garagelonggitude']),
//             infoWindow: InfoWindow(title: marker['garagename']),
//           ));
//         }
//         return markersList;
//       } else {
//         throw Exception('Failed to load markers');
//       }
//     } else {
//       throw Exception('No internet connection');
//     }
//   }
// }
