import 'dart:convert';

import 'package:crna_flutter/components/garagerepair/conponents/body.dart';
import 'package:crna_flutter/components/garagerepair/repair_screen.dart';
import 'package:crna_flutter/components/home/components/detaiPage.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class itemrepair extends StatelessWidget {
  final Map<String, dynamic> garage;
  final String username;

  final String id;

  final String proflie;

  itemrepair(
      {required this.garage,
      required String title,
      required this.username,
      required this.proflie,
      required this.id});

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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DetailPage(
                  //               garage: garage,
                  //               id: id,
                  //               proflie: proflie,
                  //               title: '',
                  //               username: username,
                  //             )));
                },
                child: Row(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Icon(
                        Icons.circle,
                        color: kPrimaryColor,
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
                            garage['repairname'],
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "ชื่อผู้แจ้ง" + garage['repairreqfullname'],
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "ปัญหา" + garage['repairreqproblem'],
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            garage['repairreqdatetime'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.green),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            garage['repairreqstatus'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.green),
                          ),
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
