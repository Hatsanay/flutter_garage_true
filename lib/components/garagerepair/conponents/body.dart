import 'dart:async';

import 'package:crna_flutter/components/list/list_screen.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:never_behind_keyboard/never_behind_keyboard.dart';

class repairBody extends StatefulWidget {
  final Map<String, dynamic> garage;
  final String username;
  final String id;
  final String proflie;
  repairBody(
      {Key? key,
      required this.username,
      required this.id,
      required this.proflie,
      required this.garage})
      : super(key: key);

  @override
  State<repairBody> createState() => _repairBodyState();
}

class _repairBodyState extends State<repairBody> {
  late GoogleMapController _mapController;
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
                          widget.garage['garagename'],
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
                  widget.garage['address'],
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
                          widget.garage['garagetel'],
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "เพิ่มเติม",
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
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  return listScreen(
                                    id: widget.id, proflie: widget.proflie,
                                    title: '',
                                    username: widget.username,
                                    // title: 'หน้าล็อกอิน',
                                  );
                                },
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child) {
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: Offset(-2.0, 0.0),
                                      end: Offset(0.0, 0.0),
                                    ).animate(animation),
                                    child: child,
                                  );
                                },
                                transitionDuration: Duration(seconds: 0)));
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
