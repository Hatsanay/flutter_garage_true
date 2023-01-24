import 'package:crna_flutter/components/garagerepair/conponents/body.dart';
import 'package:crna_flutter/components/home/components/body.dart';
import 'package:crna_flutter/components/list/list_screen.dart';
import 'package:crna_flutter/components/machanicrepair.dart/components/body.dart';
import 'package:crna_flutter/components/map_screen/map_screen.dart';
import 'package:crna_flutter/components/profile/profile_screen.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class macrepairscreen extends StatefulWidget {
  final String username;
  final String id;
  final Map<String, dynamic> machanic;

  final String proflie;
  macrepairscreen({
    Key? key,
    required String title,
    required this.username,
    required this.proflie,
    required this.id,
    required this.machanic,
  }) : super(key: key);
  // final String username;

  // HomeScreen({required this.username});
  @override
  State<macrepairscreen> createState() => macrepairscreenState();
}

class macrepairscreenState extends State<macrepairscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: macrepairBody(
        username: widget.username,
        id: widget.id,
        proflie: widget.proflie,
        machanic: widget.machanic,
      ),
      //backgroundColor: kappbar,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: kNavigationBar,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 35,
              color: kNavigationBar.withOpacity(0.38),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset("assets/icons/homeO.svg"),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/pin.svg"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return pinScreen(
                            title: 'แผนที่',
                            username: widget.username,
                            id: widget.id,
                            proflie: widget.proflie,
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
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/files.svg"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return listScreen(
                            title: 'แผนที่',
                            id: widget.id,
                            username: widget.username,
                            proflie: widget.proflie,
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
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/user.svg"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return profileScreen(
                            title: 'โปรไฟล์',
                            id: widget.id,
                            username: widget.username,
                            proflie: widget.proflie,
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
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kappbar,
      title: Text(
        'แจ้งซ่อม',
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.normal,
        ),
      ),
      // actions: <Widget>[
      //   IconButton(
      //     icon: SvgPicture.asset(
      //       "assets/icons/bell.svg",
      //     ),
      //     onPressed: () {},
      //   ),
      // ],
    );
  }
}
