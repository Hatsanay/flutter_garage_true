import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_garage_true/MyStyle.dart';
import 'package:flutter_garage_true/components/machanicrepair_teaking.dart%20copy/repair_trakingscreen.dart';
import 'package:flutter_garage_true/components/notification/dtlnoti_screen.dart';
import 'package:flutter_garage_true/components/repair_teaking.dart/repair_trakingscreen.dart';
import 'package:flutter_garage_true/constans.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:never_behind_keyboard/never_behind_keyboard.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class mechanicDetailPage extends StatefulWidget {
  final Map<String, dynamic> garage;
  final String username;

  final String id;

  final String proflie;

  final String mechanicid;
  final String mechanicfullname;
  final String mechanicsex;
  final String mechanicbirthday;
  final String mechanictel;
  final String mechanicprofile;
  final String mechaniconoff;
  mechanicDetailPage({
    Key? key,
    required this.garage,
    required String title,
    required this.username,
    required this.proflie,
    required this.mechanicid,
    required this.mechanicfullname,
    required this.mechanicsex,
    required this.mechanicbirthday,
    required this.mechanictel,
    required this.mechanicprofile,
    required this.mechaniconoff,
    required this.id,
  }) : super(key: key);

  @override
  _mechanicDetailPageState createState() => _mechanicDetailPageState();
}

class _mechanicDetailPageState extends State<mechanicDetailPage> {
  bool _like = false;
  late double lat1, lng1, lat2, lng2, distance;
  late String distanceString;
  late CameraPosition position;

  @override
  void initState() {
    super.initState();
    // garage = widget.garage;
    findlatlng1();

    // _getPolyline();
  }

  Future<Null> findlatlng1() async {
    LocationData? locationData = await findLocationData();
    setState(() {
      lat1 = locationData!.latitude!;
      lng1 = locationData.longitude!;
      lat2 = double.parse(widget.garage['repairreqlattitude']);
      lng2 = double.parse(widget.garage['repairreqlonggitude']);

      // latti1 = lat1 as String;
      // lngji1 = lng1 as String;
      print('lat1 =  $lat1, lng1 = $lng1, lat2 = $lat2, lng2 = $lng2');
      distance = calculateDistance(lat1, lng1, lat2, lng2);

      var myformat = NumberFormat('#0.0#', 'en_US');
      distanceString = myformat.format(distance);

      print('distance = $distance');
    });
  }

  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    double distance = 0;

    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
    distance = 12742 * asin(sqrt(a));

    return distance;
  }

  Future<LocationData?> findLocationData() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      // print('Could not get location: $e');
      return null;
    }
  }

  Container showMap() {
    if (lat1 != null) {
      LatLng latLng1 = LatLng(lat1, lng1);
      position = CameraPosition(
        target: latLng1,
        zoom: 12.0,
      );
    }

    // Marker userMarker() {
    //   return Marker(
    //     markerId: MarkerId(
    //       'userMarker',
    //     ),
    //     position: LatLng(lat1, lng1),
    //     icon: BitmapDescriptor.defaultMarkerWithHue(240.0),
    //     infoWindow: InfoWindow(title: 'คุณอยู่ที่นี่'),
    //   );
    // }

    Marker garagerMarker() {
      return Marker(
        markerId: MarkerId(
          'garagerMarker',
        ),
        position: LatLng(lat2, lng2),
        icon: BitmapDescriptor.defaultMarkerWithHue(0.0),
        infoWindow: InfoWindow(
          title: widget.garage['garagename'],
        ),
      );
    }

    Set<Marker> mySet() {
      return <Marker>[
        // userMarker(),
        garagerMarker(),
      ].toSet();
    }

    return Container(
      // color: kPrimaryColor,
      height: 250,
      child: lat1 == null
          ? MyStyle().showProgress()
          : GoogleMap(
              initialCameraPosition: position,
              mapType: MapType.normal,
              onMapCreated: (controller) {},
              markers: mySet(),
              myLocationEnabled: true,
              // polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      " ",
                      style: TextStyle(fontSize: 25, color: kPrimaryColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "ผู้แจ้ง : ",
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                              color: kgarage,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0))),
                          child: Text(
                            widget.garage['repairreqfullname'],
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 1, color: kPrimaryColor), //ว่าง
                ),

                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "เบอร์โทร: ",
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0))),
                          child: Text(
                            widget.garage['repairreqtel'],
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 3, color: kPrimaryColor), //ว่าง
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "ปัญหา: ",
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0))),
                          child: Text(
                            widget.garage['repairreqproblem'],
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 3, color: kPrimaryColor), //ว่าง
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "รายละเอียดรถ : ",
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0))),
                          child: Text(
                            widget.garage['repairreqcardetial'],
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 3, color: kPrimaryColor), //ว่าง
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "เพิ่มเติม : ",
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(5.0))),
                          child: Text(
                            widget.garage['repairreqspecial'],
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 3, color: kPrimaryColor), //ว่าง
                ),
                showMap(),
                Text(
                  " ",
                  style: TextStyle(fontSize: 15, color: kPrimaryColor), //ว่าง
                ),
                // Row(
                //   children: [
                //     Row(
                //       children: [
                //         Text(
                //           "ระยะห่าง: ",
                //           style: TextStyle(fontSize: 20, color: kPrimaryColor),
                //         ),
                //         Container(
                //           decoration: new BoxDecoration(
                //               color: Colors.white,
                //               borderRadius: new BorderRadius.all(
                //                   new Radius.circular(5.0))),
                //           child: Text(
                //             // distance == null ? ' ' : '$distanceString ก.ม.',
                //             '$distanceString ก.ม.',
                //             style:
                //                 TextStyle(fontSize: 20, color: kPrimaryColor),
                //           ),
                //         )
                //       ],
                //     ),
                //   ],
                // ),
                Text(
                  'แก้ไขสถานะ',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20),
                ),
                DropdownButton<int>(
                  items: [
                    DropdownMenuItem(
                      child: Text('ปฎิเสธ'),
                      value: 9,
                    ),
                    DropdownMenuItem(
                      child: Text('รอยืนยัน'),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text('กำลังเตรียมพร้อม'),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text('กำลังเดินทาง'),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text('กำลังดำเนินการซ่อม'),
                      value: 4,
                    ),
                    DropdownMenuItem(
                      child: Text('เสร็จสิ้น'),
                      value: 5,
                    ),
                  ],
                  onChanged: (value) async {
                    var url = Uri.http("192.168.1.106",
                        '/flutter_machanic/update_repair_status.php');
                    var response = await http.post(url, body: {
                      'action': 'update_repair_status',
                      'repair_id': widget.garage['repairreqid'].toString(),
                      'repair_status': value.toString(),
                    });
                    if (response.statusCode == 200) {
                      var data = json.decode(response.body);
                      if (data['status'] == 'success') {
                        setState(() {
                          widget.garage['repairreqstatus'] = value;
                        });
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //   content: Text('Status updated successfully'),
                        // ));
                        Fluttertoast.showToast(
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          msg: 'อัพเดทสถานะเสร็จสิ้น',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      } else {
                        //   Scaffold.of(context).showSnackBar(SnackBar(
                        //     content: Text('Failed to update status'),
                        //   ));
                        Fluttertoast.showToast(
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          msg: 'อัพเดทสถานะไม่สำเร็จ',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      }
                    } else {
                      // Scaffold.of(context).showSnackBar(SnackBar(
                      //   content: Text('Failed to update status'),
                      // ));
                      Fluttertoast.showToast(
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        msg: 'อัพเดทสถานะไม่สำเร็จ ERROR',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => mechanicrepairtrakingScreen(
                          garage: widget.garage,
                          id: widget.id,
                          proflie: widget.proflie,
                          title: '',
                          username: widget.username,
                          mechanicid: widget.mechanicid,
                          mechanicfullname: widget.mechanicfullname,
                          mechanicsex: widget.mechanicsex,
                          mechanicbirthday: widget.mechanicbirthday,
                          mechanictel: widget.mechanictel,
                          mechanicprofile: widget.mechanicprofile,
                          mechaniconoff: widget.mechaniconoff,
                        ),
                      ),
                    );
                  },
                  child: Text('ค้นหาเส้นทาง'),
                )
                    // RaisedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => DtlNotiScreen(
                    //           garage: widget.garage,
                    //           id: widget.id,
                    //           proflie: widget.proflie,
                    //           title: '',
                    //           username: widget.username,
                    //           garageid: widget.garageid,
                    //           garagename: widget.garagename,
                    //           garagetel: widget.garagetel,
                    //           garagelattitude: widget.garagelattitude,
                    //           garagelonggitude: widget.garagelonggitude,
                    //           garageprofile: widget.garageprofile,
                    //           garageonoff: widget.garageonoff,
                    //           ownerid: widget.ownerid,
                    //           garagedeegree: widget.garagedeegree,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    //   child: Text('Go to DtlNotiScreen'),
                    // ),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final ButtonStyle UserregisButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black,
    primary: kButtonloginColor,
    minimumSize: Size(94, 55),
    padding: EdgeInsets.symmetric(horizontal: 125),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
  );
}
