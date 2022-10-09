import 'package:crna_flutter/components/login/login.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';

class userRegisBody extends StatefulWidget {
  const userRegisBody({super.key});

  @override
  State<userRegisBody> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<userRegisBody> {
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
              left: 70,
              right: 5,
            ),
            child: Text(
              "สมัครสมาชิกสำหรับ\nผู้ใช้งานทั่วไป",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 33,
                  // fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 120,
              left: 20,
              right: 20,
            ),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'โปรดกรอกรหัสผ่าน(Password)!';
                }
                return null;
              },
              obscureText: true,
              // controller: _ctrlPassword,
              decoration: InputDecoration(
                  fillColor: ktextfieleregis,
                  filled: true,
                  labelText: 'ชื่อ-นามสกุล',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 190,
              left: 20,
              right: 20,
            ),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'โปรดกรอกรหัสผ่าน(Password)!';
                }
                return null;
              },
              obscureText: true,
              // controller: _ctrlPassword,
              decoration: InputDecoration(
                  fillColor: ktextfieleregis,
                  filled: true,
                  labelText: 'ชื่อผู้ใช้',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 260,
              left: 20,
              right: 20,
            ),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'โปรดกรอกรหัสผ่าน(Password)!';
                }
                return null;
              },
              obscureText: true,
              // controller: _ctrlPassword,
              decoration: InputDecoration(
                  fillColor: ktextfieleregis,
                  filled: true,
                  labelText: 'รหัสผ่าน',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 330,
              left: 20,
              right: 20,
            ),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'โปรดกรอกรหัสผ่าน(Password)!';
                }
                return null;
              },
              obscureText: true,
              // controller: _ctrlPassword,
              decoration: InputDecoration(
                fillColor: ktextfieleregis,
                filled: true,
                labelText: 'อีเมล',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide:
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 400,
              left: 20,
              right: 20,
            ),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'โปรดกรอกรหัสผ่าน(Password)!';
                }
                return null;
              },
              obscureText: true,
              // controller: _ctrlPassword,
              decoration: InputDecoration(
                  fillColor: ktextfieleregis,
                  filled: true,
                  labelText: 'เบอร์โทร',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 500,
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
                "สมัครสมาชิก",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              style: UserregisButtonStyle,
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
  padding: EdgeInsets.symmetric(horizontal: 120),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);
