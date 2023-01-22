import 'package:crna_flutter/components/home/home_screen.dart';
import 'package:crna_flutter/components/list/components/listbody.dart';
import 'package:crna_flutter/components/map_screen/components/googlemap.dart';
import 'package:crna_flutter/components/map_screen/map_screen.dart';
import 'package:crna_flutter/components/profile/profile_screen.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home/components/body.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class listScreen extends StatefulWidget {
  final String username;

  final String id;

  final String proflie;

  const listScreen(
      {Key? key,
      required String title,
      required this.username,
      required this.proflie,
      required this.id})
      : super(key: key);

  @override
  State<listScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<listScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: listBody(
        id: widget.id,
        proflie: widget.proflie,
        username: widget.username,
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
              icon: SvgPicture.asset("assets/icons/home.svg"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return HomeScreen(
                            title: 'หน้าแรก',
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
              icon: SvgPicture.asset("assets/icons/pin.svg"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return pinScreen(
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
              icon: SvgPicture.asset("assets/icons/fileso.svg"),
              onPressed: () {},
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
      title: const Text(
        'หน้ารายการ',
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/bell.svg",
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
