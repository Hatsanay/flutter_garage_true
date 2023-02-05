import 'package:flutter_garage_true/components/home/components/body.dart';
import 'package:flutter_garage_true/components/home/home_screen.dart';
import 'package:flutter_garage_true/components/list/list_screen.dart';
import 'package:flutter_garage_true/components/mechanichome/home_screen.dart';
import 'package:flutter_garage_true/components/mechanicnotification/components/detaiPage.dart';
import 'package:flutter_garage_true/components/mechanicnotification/home_screen.dart';
import 'package:flutter_garage_true/components/mechanicprofile/profile_screen.dart';
import 'package:flutter_garage_true/components/notification/components/detaiPage.dart';
import 'package:flutter_garage_true/components/notification/home_screen.dart';
import 'package:flutter_garage_true/constans.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class mechanicDtlNotiScreen extends StatefulWidget {
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
  final Map<String, dynamic> garage;

  mechanicDtlNotiScreen({
    Key? key,
    required String title,
    required this.username,
    required this.proflie,
    required this.id,
    required this.mechanicid,
    required this.mechanicfullname,
    required this.mechanicsex,
    required this.mechanicbirthday,
    required this.mechanictel,
    required this.mechanicprofile,
    required this.mechaniconoff,
    required this.garage,
  }) : super(key: key);
  // final String username;

  // HomeScreen({required this.username});
  @override
  State<mechanicDtlNotiScreen> createState() => _mechanicDtlNotiScreenState();
}

class _mechanicDtlNotiScreenState extends State<mechanicDtlNotiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: mechanicDetailPage(
        username: widget.username,
        id: widget.id,
        proflie: widget.proflie,
        garage: widget.garage,
        title: '',
        mechanicid: widget.mechanicid,
        mechanicfullname: widget.mechanicfullname,
        mechanicsex: widget.mechanicsex,
        mechanicbirthday: widget.mechanicbirthday,
        mechanictel: widget.mechanictel,
        mechanicprofile: widget.mechanicprofile,
        mechaniconoff: widget.mechaniconoff,
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
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return mechanicHomeScreen(
                            username: widget.username,
                            id: widget.id,
                            proflie: widget.proflie,
                            mechanicid: widget.mechanicid,
                            mechanicfullname: widget.mechanicfullname,
                            mechanicsex: widget.mechanicsex,
                            mechanicbirthday: widget.mechanicbirthday,
                            mechanictel: widget.mechanictel,
                            mechanicprofile: widget.mechanicprofile,
                            mechaniconoff: widget.mechaniconoff,
                            title: '',
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
              icon: SvgPicture.asset(
                "assets/icons/bell.svg",
                color: kPrimaryColor,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return mechanicNotiScreen(
                            username: widget.username,
                            id: widget.id,
                            proflie: widget.proflie,
                            mechanicid: widget.mechanicid,
                            mechanicfullname: widget.mechanicfullname,
                            mechanicsex: widget.mechanicsex,
                            mechanicbirthday: widget.mechanicbirthday,
                            mechanictel: widget.mechanictel,
                            mechanicprofile: widget.mechanicprofile,
                            mechaniconoff: widget.mechaniconoff,
                            title: '',
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
                          return mechanicNotiScreen(
                            id: widget.id,
                            username: widget.username,
                            proflie: widget.proflie,
                            mechanicid: widget.mechanicid,
                            mechanicfullname: widget.mechanicfullname,
                            mechanicsex: widget.mechanicsex,
                            mechanicbirthday: widget.mechanicbirthday,
                            mechanictel: widget.mechanictel,
                            mechanicprofile: widget.mechanicprofile,
                            mechaniconoff: widget.mechaniconoff,
                            title: '',
                          );
                          // listScreen(
                          //   title: 'แผนที่',
                          //   id: widget.id,
                          //   username: widget.username,
                          //   proflie: widget.proflie,
                          // );
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
                          return machanicprofileScreen(
                            id: widget.id,
                            username: widget.username,
                            proflie: widget.proflie,
                            mechanicid: widget.mechanicid,
                            mechanicfullname: widget.mechanicfullname,
                            mechanicsex: widget.mechanicsex,
                            mechanicbirthday: widget.mechanicbirthday,
                            mechanictel: widget.mechanictel,
                            mechanicprofile: widget.mechanicprofile,
                            mechaniconoff: widget.mechaniconoff,
                            title: '',
                          );
                          // profileScreen(
                          //   title: 'โปรไฟล์',
                          //   id: widget.id,
                          //   username: widget.username,
                          //   proflie: widget.proflie,
                          // );
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
        'แจ้งเตือน',
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: <Widget>[
        // IconButton(
        //   icon: SvgPicture.asset(
        //     "assets/icons/bell.svg",
        //   ),
        //   onPressed: () {},
        // ),
      ],
    );
  }
}
