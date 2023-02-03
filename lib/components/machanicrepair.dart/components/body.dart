import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crna_flutter/components/list/list_screen.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:never_behind_keyboard/never_behind_keyboard.dart';
import 'package:http/http.dart' as http;

class macrepairBody extends StatefulWidget {
  final Map<String, dynamic> machanic;
  final String username;
  final String id;
  final String proflie;
  macrepairBody(
      {Key? key,
      required this.username,
      required this.id,
      required this.proflie,
      required this.machanic})
      : super(key: key);

  @override
  State<macrepairBody> createState() => _macrepairBodyState();
}

class _macrepairBodyState extends State<macrepairBody> {
  late GoogleMapController _mapController;
  final TextEditingController repairreqfullname = TextEditingController();
  final TextEditingController repairreqtel = TextEditingController();
  final TextEditingController repairreqcardetial = TextEditingController();
  final TextEditingController repairreqspecial = TextEditingController();
  final TextEditingController repairreqproblem = TextEditingController();

  late double lat1, lng1, lat2, lng2, distance;
  late String distanceString;
  late CameraPosition position;

  late String latti1, lngji1;

  @override
  void initState() {
    super.initState();
    // garage = widget.garage;
    findlatlng1();
  }

  Future<Null> findlatlng1() async {
    LocationData? locationData = await findLocationData();
    setState(() {
      lat1 = locationData!.latitude!;
      lng1 = locationData.longitude!;
      // lat2 = double.parse(widget.garage['garagelattitude']);
      // lng2 = double.parse(widget.garage['garagelonggitude']);

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

  Future postrepairmac() async {
    var url = Uri.http(
        "192.168.1.106", '/flutter_login/postrepairmac.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "repairreqfullname": repairreqfullname.text.toString(),
      "repairreqtel": repairreqtel.text.toString(),
      "repairreqcardetial": repairreqcardetial.text.toString(),
      "repairreqspecial": repairreqspecial.text.toString(),
      "repairreqproblem": repairreqproblem.text.toString(),

      "repairreqlattitude": lat1.toString(),
      "repairreqlonggitude": lng1.toString(),

      // "repairreqlattitude": latti1.toString(),
      // "repairreqlonggitude": lngji1.toString(),

      "repairreqmacid": widget.machanic['garageid'].toString(),
      "repairname": widget.machanic['mechanicfullname'].toString(),
      "repairreqmemid": widget.id.toString(),

      // "password": pass.text.toString(),
      // "fullname": fullname.text.toString(),
      // "tel": tel.text.toString(),
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        msg: 'username ซ้ำ',
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.green,
        textColor: Colors.white,
        msg: 'แจ้งซ่อมเสร็จสิ้นเสร็จสิ้น',
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => listScreen(
            id: widget.id,
            proflie: widget.proflie,
            title: '',
            username: widget.username,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
                        "แจ้งซ่อมไปยัง: ",
                        style: TextStyle(fontSize: 20, color: kPrimaryColor),
                      ),
                      Container(
                        decoration: new BoxDecoration(
                            color: kgarage,
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(5.0))),
                        child: Text(
                          widget.machanic['mechanicfullname'],
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
                  Text(
                    "ที่อยู่:   ",
                    style: TextStyle(fontSize: 20, color: kPrimaryColor),
                  ),
                ],
              ),
              Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(5.0))),
                child: Text(
                  widget.machanic['address'],
                  style: TextStyle(fontSize: 20, color: kPrimaryColor),
                ),
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
                        "เบอร์โทร: ",
                        style: TextStyle(fontSize: 20, color: kPrimaryColor),
                      ),
                      Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(5.0))),
                        child: Text(
                          widget.machanic['mechanictel'],
                          style: TextStyle(fontSize: 20, color: kPrimaryColor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      " ",
                      style:
                          TextStyle(fontSize: 9, color: kPrimaryColor), //ว่าง
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'โปรดกรอกรหัสผ่าน(ชื่อ-นามสกุล)!';
                        }
                        return null;
                      },
                      controller: repairreqfullname,
                      scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "ชื่อ-นามสกุล",
                      ),
                      keyboardType: TextInputType.name,
                      // keyboardType: TextInputType.numberWithOptions(
                      //   decimal: false,
                      //   signed: true,
                      // ),
                    ),
                    Text(
                      " ",
                      style:
                          TextStyle(fontSize: 9, color: kPrimaryColor), //ว่าง
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'โปรดกรอกรหัสผ่าน(เบอร์โทร)!';
                        }
                        return null;
                      },
                      controller: repairreqtel,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "เบอร์โทร",
                      ),
                      // keyboardType: TextInputType.name,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                        signed: true,
                      ),
                    ),
                    Text(
                      " ",
                      style:
                          TextStyle(fontSize: 9, color: kPrimaryColor), //ว่าง
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'โปรดกรอกรหัสผ่าน(รายละเอียดรถ ยี่ห้อ, รุ่น, สี)!';
                        }
                        return null;
                      },
                      controller: repairreqcardetial,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "รายละเอียดรถ ยี่ห้อ, รุ่น, สี",
                      ),
                      keyboardType: TextInputType.name,
                      // keyboardType: TextInputType.numberWithOptions(
                      //   decimal: false,
                      //   signed: true,
                      // ),
                    ),
                    Text(
                      " ",
                      style:
                          TextStyle(fontSize: 9, color: kPrimaryColor), //ว่าง
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'โปรดกรอกรหัสผ่าน(ปัญหาเบื้องต้น)!';
                        }
                        return null;
                      },
                      controller: repairreqproblem,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "ปัญหาเบื้องต้น",
                      ),
                      keyboardType: TextInputType.name,
                      // keyboardType: TextInputType.numberWithOptions(
                      //   decimal: false,
                      //   signed: true,
                      // ),
                    ),
                    Text(
                      " ",
                      style:
                          TextStyle(fontSize: 9, color: kPrimaryColor), //ว่าง
                    ),
                    TextFormField(
                      controller: repairreqspecial,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "สถานที่ไกล้เคียง",
                      ),
                      keyboardType: TextInputType.name,
                      // keyboardType: TextInputType.numberWithOptions(
                      //   decimal: false,
                      //   signed: true,
                      // ),
                    ),
                    Text(
                      " ",
                      style:
                          TextStyle(fontSize: 9, color: kPrimaryColor), //ว่าง
                    ),
                    Text(
                      " ",
                      style:
                          TextStyle(fontSize: 9, color: kPrimaryColor), //ว่าง
                    ),
                    // Container(
                    //   child: Card(
                    //     elevation: 5,
                    //     margin: EdgeInsets.all(8),
                    //     child: Container(
                    //       width: double.infinity,
                    //       height: double.infinity,
                    //       child: GoogleMap(
                    //         onMapCreated: (GoogleMapController controller) {
                    //           _mapController = controller;
                    //         },
                    //         initialCameraPosition: CameraPosition(
                    //           target: LatLng(37.4219999, -122.0840575),
                    //           zoom: 12.0,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        postrepairmac();
                      },
                      child: Text(
                        "แจ้งซ่อม",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      style: UserregisButtonStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final ButtonStyle UserregisButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black,
    primary: kButtonloginColor,
    minimumSize: Size(94, 55),
    padding: EdgeInsets.symmetric(horizontal: 120),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
  );
}
