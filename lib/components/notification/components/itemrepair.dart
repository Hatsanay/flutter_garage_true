import 'dart:convert';

import 'package:flutter_garage_true/components/notification/dtlnoti_screen.dart';
import 'package:flutter_garage_true/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class itemrepair extends StatefulWidget {
  final Map<String, dynamic> garage;
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

  itemrepair({
    required this.garage,
    required String title,
    required this.username,
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
    required this.id,
  });

  @override
  State<itemrepair> createState() => _itemrepairState();
}

class _itemrepairState extends State<itemrepair> {
  showstatus() {
    if (int.parse(widget.garage['repairreqstatus']) == 1) {
      return Text(
        "รอยืนยัน",
        style: TextStyle(color: Colors.red),
      );
    } else if (int.parse(widget.garage['repairreqstatus']) == 2) {
      return Text(
        "กำลังเตรียมพร้อม",
        style: TextStyle(color: Color.fromARGB(255, 179, 101, 0)),
      );
    } else if (int.parse(widget.garage['repairreqstatus']) == 3) {
      return Text(
        "กำลังเดินทาง",
        style: TextStyle(color: Colors.orangeAccent),
      );
    } else if (int.parse(widget.garage['repairreqstatus']) == 4) {
      return Text(
        "กำลังดำเนินการซ่อม",
        style: TextStyle(color: Color.fromARGB(255, 245, 193, 125)),
      );
    } else if (int.parse(widget.garage['repairreqstatus']) == 5) {
      return Text(
        "เสร็จสิ้น",
        style: TextStyle(color: Colors.green),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DtlNotiScreen(
                                garage: widget.garage,
                                id: widget.id,
                                proflie: widget.proflie,
                                title: '',
                                username: widget.username,
                                garageid: widget.garageid,
                                garagename: widget.garagename,
                                garagetel: widget.garagetel,
                                garagelattitude: widget.garagelattitude,
                                garagelonggitude: widget.garagelonggitude,
                                garageprofile: widget.garageprofile,
                                garageonoff: widget.garageonoff,
                                ownerid: widget.ownerid,
                                garagedeegree: widget.garagedeegree,
                              )));
                },
                child: Row(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Icon(
                        Icons.circle,
                        color: Colors.red,
                      ),
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(60),
                      //   child: Image.network(
                      //     garage['garageprofile'],
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.garage['repairreqfullname'],
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "รายละเอียดรถ : " +
                                widget.garage['repairreqcardetial'],
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "ปัญหา : " + widget.garage['repairreqproblem'],
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            widget.garage['repairreqdatetime'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.green),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          showstatus(),
                          // Text(
                          //   widget.garage['repairreqstatus'],
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 18,
                          //       color: Colors.green),
                          // ),
                        ],
                      ),
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
}

// class repairProvider {
//   static Future<List<Map<String, dynamic>>> fetchData() async {
//     var url = 'http://192.168.1.106/flutter_login/getlistgarage.php';
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return data.map((d) => Map<String, dynamic>.from(d)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
