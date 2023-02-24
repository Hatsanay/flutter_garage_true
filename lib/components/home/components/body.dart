import 'package:flutter/material.dart';
import 'package:flutter_garage_true/constans.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class homeBody extends StatefulWidget {
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

  homeBody({
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
  }) : super(key: key);
  @override
  State<homeBody> createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody> {
  String _response = 'No response yet';
  @override
  void initState() {
    repairnoti(widget.garageid);
    _getamountlist(widget.garageid);
    super.initState();
    // _sendRequest();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Text(
            //   "Dashboard",
            //   style: TextStyle(fontSize: 35, color: kPrimaryColor),
            // ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(80),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  border: Border.all(
                      color: kBackgoundColor, // Set border color
                      width: 3.0), // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(25.0)), // Set rounded corner radius
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Color.fromARGB(255, 226, 118, 118),
                        offset: Offset(1, 3))
                  ] // Make rounded corner of border
                  ),
              child: Column(
                children: <Widget>[
                  Text(
                    "การแจ้งเตือน",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  FutureBuilder(
                    future: repairnoti.fetchData(widget.garageid),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data[0]["countnoti"].toString(),
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(80),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(
                      color: kBackgoundColor, // Set border color
                      width: 3.0), // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(25.0)), // Set rounded corner radius
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Color.fromARGB(255, 226, 118, 118),
                        offset: Offset(1, 3))
                  ] // Make rounded corner of border
                  ),
              child: Column(
                children: <Widget>[
                  Text(
                    "จำนวนการแจ้งซ่อม",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  FutureBuilder(
                    future: _getamountlist.fetchData(widget.garageid),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data[0]["countlist"].toString(),
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
            // Text(
            //   "ยังไม่พร้อมใช้งาน",
            //   style: TextStyle(fontSize: 15),
            // ),
          ],
        ),
      ),
    );
  }
}

// class repairnoti {
//   static Future<List<Map<String, dynamic>>> fetchData(String id) async {
//     // var url = 'http://192.168.1.100/flutter_login/getrepair.php';
//     // var response = await http.get(Uri.parse(url));
//     var url = Uri.http(
//         "192.168.1.100", '/flutter_login/getrepair.php', {'q': '{http}'});
//     var response = await http.post(url, body: {
//       "memid": id.toString(),

//       // "password": pass.text.toString(),
//       // "fullname": fullname.text.toString(),
//       // "tel": tel.text.toString(),
//     });

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return data.map((d) => Map<String, dynamic>.from(d)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }

class repairnoti {
  repairnoti(String mechanicid);
  static Future<List<Map<String, dynamic>>> fetchData(String garageid) async {
    // var url = 'http://192.168.1.100/flutter_login/getrepair.php';
    // var response = await http.get(Uri.parse(url));
    var url = Uri.http(
        "192.168.1.100", '/flutter_garage/getamountnoti.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "garageid": garageid.toString(),

      // "password": pass.text.toString(),
      // "fullname": fullname.text.toString(),
      // "tel": tel.text.toString(),
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((d) => Map<String, dynamic>.from(d)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class _getamountlist {
  _getamountlist(String mechanicid);
  static Future<List<Map<String, dynamic>>> fetchData(String garageid) async {
    // var url = 'http://192.168.1.100/flutter_login/getrepair.php';
    // var response = await http.get(Uri.parse(url));
    var url = Uri.http(
        "192.168.1.100", '/flutter_garage/getamountlist.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "garageid": garageid.toString(),

      // "password": pass.text.toString(),
      // "fullname": fullname.text.toString(),
      // "tel": tel.text.toString(),
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((d) => Map<String, dynamic>.from(d)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
