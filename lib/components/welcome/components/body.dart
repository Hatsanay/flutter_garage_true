import 'package:flutter_garage_true/components/login/login.dart';
import 'package:flutter_garage_true/constans.dart';
import 'package:flutter/material.dart';

class welbody extends StatefulWidget {
  const welbody({super.key});

  @override
  State<welbody> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<welbody> {
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
              top: 150,
              left: 5,
              right: 5,
            ),
            child: Image.asset(
              'assets/icons/Logo.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 400,
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
                "เข้าสู่ระบบ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: LoginButtonStyle,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 465,
          //     left: 13,
          //     right: 5,
          //   ),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           PageRouteBuilder(
          //               pageBuilder: (context, Animation<double> animation,
          //                   Animation<double> secondaryAnimation) {
          //                 return welbody(
          //                     // title: 'หน้าล็อกอิน',
          //                     );
          //               },
          //               transitionsBuilder: (BuildContext context,
          //                   Animation<double> animation,
          //                   Animation<double> secondaryAnimation,
          //                   Widget child) {
          //                 return SlideTransition(
          //                   position: Tween<Offset>(
          //                     begin: Offset(-2.0, 0.0),
          //                     end: Offset(0.0, 0.0),
          //                   ).animate(animation),
          //                   child: child,
          //                 );
          //               },
          //               transitionDuration: Duration(seconds: 0)));
          //     },
          //     child: Text(
          //       "ยังไม่เคยใช้ สมัครสมาชิก!",
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: Colors.brown,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     style: RegisButtonStyle,
          //   ),
          // ),
        ],
      ),
    );
  }
}

final ButtonStyle LoginButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black,
  primary: kButtonloginColor,
  minimumSize: Size(94, 55),
  padding: EdgeInsets.symmetric(horizontal: 137),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

final ButtonStyle RegisButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black,
  primary: kButtonregis,
  minimumSize: Size(88, 55),
  padding: EdgeInsets.symmetric(horizontal: 70),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
