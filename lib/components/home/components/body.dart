import 'package:crna_flutter/components/home/components/listProvider.dart';
import 'package:crna_flutter/components/home/components/garageItemcard.dart';
import 'package:crna_flutter/components/home/components/machanicItemcard.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class homeBody extends StatefulWidget {
  final String username;
  final String id;
  final String proflie;

  homeBody(
      {Key? key,
      required this.username,
      required this.id,
      required this.proflie})
      : super(key: key);
  @override
  State<homeBody> createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody> {
  static Future<List<Map<String, dynamic>>> fetchData() async {
    var url = 'http://192.168.1.101/flutter_login/getlistcoffee.php';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((d) => Map<String, dynamic>.from(d)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          // image: AssetImage("assetsimages/cuspro/test1.png"),
                          image: NetworkImage(widget.proflie),
                          fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(1.0),
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                  ),
                ),
                Positioned(
                  bottom: 90,
                  left: 20,
                  child: RichText(
                    text: TextSpan(
                        // text: "ยินดีต้อนรับ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                        children: [
                          TextSpan(
                              text: widget.username,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24))
                        ]),
                  ),
                )
              ],
            ),
            Transform.translate(
              offset: Offset(0.0, -(height * 0.3 - height * 0.26)),
              child: Container(
                width: width,
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: <Widget>[
                        TabBar(
                          labelColor: kPrimaryColor,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          unselectedLabelColor: Colors.grey[400],
                          unselectedLabelStyle: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: kPrimaryColor,
                          tabs: <Widget>[
                            Tab(
                              child: Text("อู่"),
                            ),
                            Tab(
                              child: Text("ช่าง"),
                            ),
                            // Tab(
                            //   child: Text("Orthers"),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 3),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Icon(
                                    Icons.search,
                                    size: 30,
                                  ),
                                ),
                                hintText: "Search your garage",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 1.0, color: Colors.grey))),
                          ),
                        ),
                        Container(
                          height: height * 0.6,
                          child: TabBarView(
                            children: <Widget>[
                              FutureBuilder<List<Map<String, dynamic>>>(
                                future: GarageProvider.fetchData(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      itemCount: snapshot.data?.length,
                                      itemBuilder: (context, index) {
                                        return MenuItemCard(
                                          garage: snapshot.data![index],
                                          id: widget.id,
                                          proflie: widget.proflie,
                                          title: '',
                                          username: widget.username,
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child: Text("${snapshot.error}"));
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                              ),
                              FutureBuilder<List<Map<String, dynamic>>>(
                                future: machanicProvider.fetchData(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      itemCount: snapshot.data?.length,
                                      itemBuilder: (context, index) {
                                        return machanicItemCard(
                                            machanic: snapshot.data![index]);
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child: Text("${snapshot.error}"));
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                              ),
                              // machanicpage(),
// OrtherPage(),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    ));
  }
}




















// import 'dart:convert';

// import 'package:crna_flutter/components/login/login.dart';
// import 'package:crna_flutter/constans.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class homeBody extends StatefulWidget {
//   final String username;
//   final String id;

//   final String proflie;

//   homeBody(
//       {Key? key,
//       required this.username,
//       required this.id,
//       required this.proflie})
//       : super(key: key);
//   // final String username;

//   @override
//   State<homeBody> createState() => _homeBodyState();
// }

// class _homeBodyState extends State<homeBody> {
//   Future getContactData() async {
//     var url = 'http://192.168.1.101/flutter_login/getlistgarage.php';
//     var response = await http.get(Uri.parse(url));
//     return jsonDecode(response.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       children: <Widget>[
//         Container(
//           margin: EdgeInsets.all(10),
//           padding: EdgeInsets.all(50),
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               color: kPrimaryColor,
//               border: Border.all(
//                   color: kBackgoundColor, // Set border color
//                   width: 3.0), // Set border width
//               borderRadius: BorderRadius.all(
//                   Radius.circular(25.0)), // Set rounded corner radius
//               boxShadow: [
//                 BoxShadow(
//                     blurRadius: 10,
//                     color: Color.fromARGB(255, 226, 118, 118),
//                     offset: Offset(1, 3))
//               ] // Make rounded corner of border
//               ),
//           child: Column(
//             children: <Widget>[
//               CircleAvatar(
//                 backgroundColor: Colors.black,
//                 radius: 60,
//                 child: CircleAvatar(
//                   radius: 110,
//                   backgroundImage: NetworkImage(widget.proflie),
//                   // backgroundImage: AssetImage('assets/icons/'),
//                 ),
//               ),
//               Text(
//                 widget.username,
//                 style: TextStyle(color: Colors.white, fontSize: 30),
//               ),
//             ],
//           ),
//         ),
//       ],
//       // children: <Widget>[
//       //   Padding(
//       //     padding: const EdgeInsets.only(
//       //       top: 1,
//       //       left: 15,
//       //       right: 15,
//       //     ),
//       //     child: TextFormField(
//       //       validator: (value) {
//       //         if (value == null || value.isEmpty) {
//       //           return 'โปรดกรอกรหัสผ่าน(Password)!';
//       //         }
//       //         return null;
//       //       },
//       //       obscureText: true,
//       //       // controller: _ctrlPassword,
//       //       decoration: InputDecoration(
//       //           fillColor: ktextfieleregis,
//       //           filled: true,
//       //           labelText: 'ค้นหาหรืออู่ฯ',
//       //           prefixIcon: Icon(
//       //             Icons.search,
//       //             color: kPrimaryColor,
//       //           ),
//       //           border: OutlineInputBorder(
//       //               borderRadius: BorderRadius.circular(20.0))),
//       //     ),
//       //   ),
//       //   Container(
//       //     // margin: new EdgeInsets.symmetric(horizontal: 10.0),
//       //     margin: const EdgeInsets.only(
//       //       left: 10.0,
//       //       right: 10.0,
//       //       top: 10.0,
//       //     ),
//       //     decoration: BoxDecoration(
//       //       border: Border.all(
//       //         color: kPrimaryColor,
//       //         style: BorderStyle.solid,
//       //         // width: 8.0,
//       //         width: 90,
//       //       ),
//       //       borderRadius: BorderRadius.circular(20.0),
//       //       color: kPrimaryColor,
//       //     ),
//       //   ),
//       //   Container(
//       //     margin: const EdgeInsets.only(
//       //       left: 10.0,
//       //       right: 10.0,
//       //       top: 10.0,
//       //     ),
//       //     child: Row(
//       //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //       children: <Widget>[
//       //         ElevatedButton(
//       //           onPressed: () {
//       //             Navigator.push(
//       //                 context,
//       //                 PageRouteBuilder(
//       //                     pageBuilder: (context, Animation<double> animation,
//       //                         Animation<double> secondaryAnimation) {
//       //                       return loginPage(
//       //                           // title: 'หน้าล็อกอิน',
//       //                           );
//       //                     },
//       //                     transitionsBuilder: (BuildContext context,
//       //                         Animation<double> animation,
//       //                         Animation<double> secondaryAnimation,
//       //                         Widget child) {
//       //                       return SlideTransition(
//       //                         position: Tween<Offset>(
//       //                           begin: Offset(-2.0, 0.0),
//       //                           end: Offset(0.0, 0.0),
//       //                         ).animate(animation),
//       //                         child: child,
//       //                       );
//       //                     },
//       //                     transitionDuration: Duration(seconds: 0)));
//       //           },
//       //           child: Text(
//       //             "ช่าง",
//       //             style: TextStyle(
//       //                 fontSize: 20,
//       //                 color: Colors.white,
//       //                 fontWeight: FontWeight.normal),
//       //           ),
//       //           style: LoginButtonStyle,
//       //         ),
//       //         ElevatedButton(
//       //           onPressed: () {
//       //             Navigator.push(
//       //                 context,
//       //                 PageRouteBuilder(
//       //                     pageBuilder: (context, Animation<double> animation,
//       //                         Animation<double> secondaryAnimation) {
//       //                       return loginPage(
//       //                           // title: 'หน้าล็อกอิน',
//       //                           );
//       //                     },
//       //                     transitionsBuilder: (BuildContext context,
//       //                         Animation<double> animation,
//       //                         Animation<double> secondaryAnimation,
//       //                         Widget child) {
//       //                       return SlideTransition(
//       //                         position: Tween<Offset>(
//       //                           begin: Offset(-2.0, 0.0),
//       //                           end: Offset(0.0, 0.0),
//       //                         ).animate(animation),
//       //                         child: child,
//       //                       );
//       //                     },
//       //                     transitionDuration: Duration(seconds: 0)));
//       //           },
//       //           child: Text(
//       //             "อู่หรือศูนย์",
//       //             style: TextStyle(
//       //                 fontSize: 20,
//       //                 color: Colors.white,
//       //                 fontWeight: FontWeight.normal),
//       //           ),
//       //           style: LoginButtonStyle,
//       //         ),
//       //         ElevatedButton(
//       //           onPressed: () {
//       //             Navigator.push(
//       //                 context,
//       //                 PageRouteBuilder(
//       //                     pageBuilder: (context, Animation<double> animation,
//       //                         Animation<double> secondaryAnimation) {
//       //                       return loginPage(
//       //                           // title: 'หน้าล็อกอิน',
//       //                           );
//       //                     },
//       //                     transitionsBuilder: (BuildContext context,
//       //                         Animation<double> animation,
//       //                         Animation<double> secondaryAnimation,
//       //                         Widget child) {
//       //                       return SlideTransition(
//       //                         position: Tween<Offset>(
//       //                           begin: Offset(-2.0, 0.0),
//       //                           end: Offset(0.0, 0.0),
//       //                         ).animate(animation),
//       //                         child: child,
//       //                       );
//       //                     },
//       //                     transitionDuration: Duration(seconds: 0)));
//       //           },
//       //           child: Text(
//       //             "รถลาก",
//       //             style: TextStyle(
//       //                 fontSize: 20,
//       //                 color: Colors.white,
//       //                 fontWeight: FontWeight.normal),
//       //           ),
//       //           style: LoginButtonStyle,
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       //   Container(
//       //     margin: const EdgeInsets.only(
//       //       left: 0.0,
//       //       right: 210.0,
//       //       top: 10.0,
//       //     ),
//       //     child: Text(
//       //       "อู่หรือศูนย์ไกล้ฉัน",
//       //       style: TextStyle(
//       //           fontSize: 18,
//       //           fontWeight: FontWeight.normal,
//       //           color: kPrimaryColor),
//       //     ),
//       //   ),
//       //   Container(
//       //     // margin: new EdgeInsets.symmetric(horizontal: 10.0),
//       //     margin: const EdgeInsets.only(
//       //       left: 10.0,
//       //       right: 10.0,
//       //       top: 10.0,
//       //     ),
//       //     decoration: BoxDecoration(
//       //       border: Border.all(
//       //         color: klistgarage,
//       //         style: BorderStyle.solid,
//       //         // width: 8.0,
//       //         width: 100,
//       //       ),
//       //       borderRadius: BorderRadius.circular(20.0),
//       //       color: kPrimaryColor,
//       //     ),
//       //   ),
//       // ],
//     );
//   }
// }

// // final ButtonStyle LoginButtonStyle = ElevatedButton.styleFrom(
// //   onPrimary: Colors.black,
// //   primary: kButtonloginColor,
// //   minimumSize: Size(94, 40),
// //   padding: EdgeInsets.symmetric(horizontal: 10),
// //   shape: const RoundedRectangleBorder(
// //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
// //   ),
// // );
