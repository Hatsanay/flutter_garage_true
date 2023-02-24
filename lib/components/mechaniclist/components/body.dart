import 'package:flutter_garage_true/components/list/components/itemlistrepiar.dart';
import 'package:flutter_garage_true/components/mechaniclist/components/itemlistrepiar.dart';
import 'package:flutter_garage_true/components/notification/components/itemrepair.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class mechaniclistBody extends StatefulWidget {
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

  mechaniclistBody({
    Key? key,
    required this.username,
    required this.id,
    required this.proflie,
    required this.mechanicid,
    required this.mechanicfullname,
    required this.mechanicsex,
    required this.mechanicbirthday,
    required this.mechanictel,
    required this.mechanicprofile,
    required this.mechaniconoff,
  }) : super(key: key);
  @override
  State<mechaniclistBody> createState() => _mechaniclistBodyState();
}

class _mechaniclistBodyState extends State<mechaniclistBody> {
  List repairs = [];

  @override
  void initState() {
    super.initState();
    _getRepairs3();
  }

  // _getRepairs() async {
  //   // var url = 'http://yourserver.com/get_repairs.php';
  //   var url = Uri.http("192.168.1.100", '/flutter_garage/get_repairs.php');
  //   var response = await http.post(url, body: {
  //     'action': 'get_repairs',
  //     'garageid': widget.garageid.toString(),
  //   });
  //   var repairsData = json.decode(response.body);
  //   setState(() {
  //     repairs = repairsData;
  //   });
  // }

  _updateRepair(id, status) async {
    var url = Uri.http("192.168.1.100", '/flutter_garage/update_repair.php');
    var response = await http.post(url,
        body: {'action': 'update_repair', 'id': id, 'status': status});
    print(response.body);
    _getRepairs3();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getRepairs3.fetchData(widget.mechanicid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return mechanicitemlistrepair(
                  garage: snapshot.data![index],
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
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(""));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class _getRepairs3 {
  static Future<List<Map<String, dynamic>>> fetchData(String mechanicid) async {
    // var url = 'http://192.168.1.100/flutter_login/getrepair.php';
    // var response = await http.get(Uri.parse(url));
    var url = Uri.http("192.168.1.100", '/flutter_machanic/getlist_repair.php',
        {'q': '{http}'});
    var response = await http.post(url, body: {
      'mechanicid': mechanicid.toString(),
      // 'garageid': garageid.toString(),

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
