import 'package:crna_flutter/components/login/login.dart';
import 'package:crna_flutter/constans.dart';
import 'package:crna_flutter/register/usersregister_screen.dart';
import 'package:flutter/material.dart';

class listbody extends StatefulWidget {
  const listbody({super.key});

  @override
  State<listbody> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<listbody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 100),
      // padding: const EdgeInsets.all(10.0),
      alignment: Alignment.topCenter,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 1,
              left: 58,
              right: 5,
            ),
            child: Text(
              "รายการลงทะเบียน",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
              left: 13,
              right: 5,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return UserRegisScreen(
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
                "ผู้ใช้งานทั่วไป",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: UserregisButtonStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 190,
              left: 13,
              right: 5,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return loginPage(
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
                "อู่/ศูนย์ให้บริการ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: garageButtonStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 300,
              left: 13,
              right: 5,
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return loginPage(
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
                "ช่างอิสระ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: machanicButtonStyle,
            ),
          ),
        ],
      ),
    );
  }
}

final ButtonStyle UserregisButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black,
  primary: kButtonloginColor,
  minimumSize: Size(94, 55),
  padding: EdgeInsets.symmetric(horizontal: 110),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

final ButtonStyle garageButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black,
  primary: kButtonloginColor,
  minimumSize: Size(94, 55),
  padding: EdgeInsets.symmetric(horizontal: 100),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

final ButtonStyle machanicButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black,
  primary: kButtonloginColor,
  minimumSize: Size(94, 55),
  padding: EdgeInsets.symmetric(horizontal: 130),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
