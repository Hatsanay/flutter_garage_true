import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_garage_true/constans.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class profilebody extends StatefulWidget {
  // final Map<String, dynamic> garage;
  final String username;
  final String id;
  final String proflie;

  final String garageid;
  final String garagename;
  final String garagetel;
  final String garagelattitude;
  final String garagelonggitude;
  final String garageprofile;
  final String garageonoff;
  final String ownerid;
  final String garagedeegree;
  profilebody({
    Key? key,
    required this.username,
    required this.id,
    required this.proflie,
    required this.garageid,
    required this.garagename,
    required this.garagetel,
    required this.garagelattitude,
    required this.garagelonggitude,
    required this.garageprofile,
    required this.garageonoff,
    required this.ownerid,
    required this.garagedeegree,
    // required this.garage
  }) : super(key: key);

  @override
  State<profilebody> createState() => _profilebodyState();
}

class _profilebodyState extends State<profilebody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Container(
          //   margin: EdgeInsets.all(10),
          //   padding: EdgeInsets.all(50),
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //       color: kPrimaryColor,
          //       border: Border.all(
          //           color: kBackgoundColor, // Set border color
          //           width: 3.0), // Set border width
          //       borderRadius: BorderRadius.all(
          //           Radius.circular(25.0)), // Set rounded corner radius
          //       boxShadow: [
          //         BoxShadow(
          //             blurRadius: 10,
          //             color: Color.fromARGB(255, 226, 118, 118),
          //             offset: Offset(1, 3))
          //       ] // Make rounded corner of border
          //       ),
          //   child: Column(
          //     children: <Widget>[
          //       CircleAvatar(
          //         backgroundColor: Colors.black,
          //         radius: 60,
          //         child: CircleAvatar(
          //           radius: 110,
          //           backgroundImage: NetworkImage(widget.proflie),
          //           // backgroundImage: AssetImage('assets/icons/'),
          //         ),
          //       ),
          //       Text(
          //         widget.username,
          //         style: TextStyle(color: Colors.white, fontSize: 30),
          //       ),
          //     ],
          //   ),
          // ),
          // Text(
          //   "ยังไม่พร้อมใช้งาน",
          //   style: TextStyle(fontSize: 15),
          // ),
          Center(
            child: Text(
              "ยังไม่พร้อมใช้งาน",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
