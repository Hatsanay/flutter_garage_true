import 'package:crna_flutter/components/login/login.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              left: 19,
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
                'เข้าสู่ระบบ',
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: LoginButtonStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 460,
              left: 19,
              right: 5,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'ลงทะเบียน',
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: RegisButtonStyle,
            ),
          ),
        ],
      ),
    );
  }
}

final ButtonStyle LoginButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black,
  primary: kButtonloginColor,
  minimumSize: Size(90, 50),
  padding: EdgeInsets.symmetric(horizontal: 135),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

final ButtonStyle RegisButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black,
  primary: kButtonregis,
  minimumSize: Size(90, 50),
  padding: EdgeInsets.symmetric(horizontal: 135),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
