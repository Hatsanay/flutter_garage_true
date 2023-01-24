import 'dart:convert';

import 'package:crna_flutter/components/login/login.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class regisbody extends StatefulWidget {
  const regisbody({super.key});

  @override
  State<regisbody> createState() => _regisbodyState();
}

class _regisbodyState extends State<regisbody> {
  bool _isVisible = false;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController conpass = TextEditingController();
  final TextEditingController tel = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();

  Future register() async {
    var url = Uri.http(
        "192.168.1.101", '/flutter_login/register.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "username": user.text.toString(),
      "password": pass.text.toString(),
      "tel": tel.text.toString(),
      "fullname": fullname.text.toString(),
      "email": email.text.toString(),
      // "fullname": fullname.text.toString(),
      // "tel": tel.text.toString(),
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        msg: 'username ซ้ำ',
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.green,
        textColor: Colors.white,
        msg: 'สมัครสมาชิกเสร็จสิ้น',
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => loginPage(),
        ),
      );
    }
  }

  get _dropdowncallback => null;
  String dropdownvalue = 'ผู้ใช้ทั่วไป';

  // List of items in our dropdown menu
  int _value = 1;
  List<ListItem> _dropdownItems = [
    ListItem(1, "ผู้ใช้ทั่วไป"),
    ListItem(2, "อู่/ศูนย์"),
    ListItem(3, "ช่างอิสระ"),
  ];

////////////////////////
/////เปิดดูรหัสผ่าน////////
///////////////////////
  IconButton visible() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isVisible = !_isVisible;
        });
      },
      icon: _isVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
    );
  }

  //Method
////////////////////////
///////ปุ่มย้อนกลับ////////
///////////////////////
  Widget backButton() {
    return IconButton(
      icon: Icon(
        Icons.navigate_before,
        size: 36.0,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

////////////////////////
///////แบบlist////////  ยังไม่ใช้
///////////////////////
  Widget regiscon1() {
    return ListView(
      padding: const EdgeInsets.only(top: 50),
      children: <Widget>[
        showAppName(),
        usernameText(),
        passwordText(),
        confirmpasswordText(),
        //   fullnameText(),
        //   emailText(),
        //   phoneText(),
      ],
    );
  }

////////////////////////
///////หัวช่องกรอก////////
///////////////////////
  Widget content() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  children: [
                    showAppName(),
                    usernameText(),
                    passwordText(),
                    confirmpasswordText(),
                    fullnameText(),
                    telText(),
                    emailText(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//แสดงชื่อและโลโก้
  Widget showAppName() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        showLogo(),
        // showText(),
      ],
    );
  }

// โลโก้
  Widget showLogo() {
    return Container(
      width: 350.0,
      height: 110.0,
      child: Image.asset('assets/icons/Logo.png'),
    );
  }

// ชื่อ
  Widget showText() {
    return Text(
      'เข้าสู่ระบบ',
      style: TextStyle(fontSize: 30.0, fontFamily: ''),
    );
  }

  Widget usernameText() {
    return Container(
      width: 320.0,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'โปรดกรอกรหัสผ่าน(Password)!';
          }
          return null;
        },
        controller: user,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(
              Icons.person,
              size: 36.0,
              color: kPrimaryColor,
            ),
            labelText: 'Username',
            labelStyle: TextStyle(color: kPrimaryColor)),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 320.0,
      child: new TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'โปรดกรอกรหัสผ่าน(Password)!';
          }
          return null;
        },
        controller: pass,
        obscureText: !_isVisible,
        decoration: InputDecoration(
          suffixIcon: visible(),
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: kPrimaryColor,
          ),
          labelText: 'รหัสผ่าน',
          labelStyle: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }

  Widget fullnameText() {
    return Container(
      width: 320.0,
      child: new TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'โปรดกรอก fullname!';
          }
          return null;
        },
        controller: fullname,
        // obscureText: !_isVisible,
        decoration: InputDecoration(
          // suffixIcon: visible(),
          icon: Icon(
            Icons.person_add,
            size: 36.0,
            color: kPrimaryColor,
          ),
          labelText: 'ชื่อ-นามสกุล',
          labelStyle: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }

  Widget telText() {
    return Container(
      width: 320.0,
      child: new TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'โปรดกรอก Phone!';
          }
          return null;
        },
        controller: tel,
        // obscureText: !_isVisible,
        decoration: InputDecoration(
          // suffixIcon: visible(),
          icon: Icon(
            Icons.phone,
            size: 36.0,
            color: kPrimaryColor,
          ),
          labelText: 'เบอร์โทร',
          labelStyle: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 320.0,
      child: new TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'โปรดกรอกรหัสผ่าน(Password)!';
          }
          return null;
        },
        controller: email,
        // obscureText: !_isVisible,
        decoration: InputDecoration(
          // suffixIcon: visible(),
          icon: Icon(
            Icons.email,
            size: 36.0,
            color: kPrimaryColor,
          ),
          labelText: 'อีเมล์',
          labelStyle: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }

////////////////////////
///////เช็ครหัสผ่าน////////
///////////////////////
  Future confirmcheck() async {
    if (pass == null) {
      Fluttertoast.showToast(
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        msg: 'โปรดกรอกรหัสผ่าน',
        toastLength: Toast.LENGTH_SHORT,
      );
    } else if (pass.value != conpass.value) {
      Fluttertoast.showToast(
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        msg: 'รหัสผ่านไม่ตรงกัน',
        toastLength: Toast.LENGTH_SHORT,
      );
      return false;
    } else {
      register();
      // register2();
    }
  }

  // Widget checkpass() {
  //   return
  // }
  Widget confirmpasswordText() {
    return Container(
      width: 320.0,
      child: TextFormField(
        controller: conpass,
        obscureText: !_isVisible,
        decoration: InputDecoration(
            suffixIcon: visible(),
            icon: Icon(
              Icons.check,
              size: 36.0,
              color: kPrimaryColor,
            ),
            labelText: 'ยืนยันรหัสผ่าน',
            labelStyle: TextStyle(color: kPrimaryColor)),
      ),
    );
  }

////////////////////////
///////เลือกlavel////////
///////////////////////
  Widget dropbox() {
    return Container(
      child: DropdownButton(
        // Initial Value
        value: _value,

        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        // Array list of items
        items: _dropdownItems.map((ListItem item) {
          return DropdownMenuItem<int>(
            child: Text(item.name),
            value: item.value,
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (value) {
          setState(() {
            // _value = value!;
          });
        },
      ),
    );
  }

///////////////////////////////////////////////////////////
  // Widget fullnameText() {
  //   return Container(
  //     width: 320.0,
  //     child: TextFormField(
  //       obscureText: true,
  //       decoration: InputDecoration(
  //           icon: Icon(
  //             Icons.person_add_sharp,
  //             size: 36.0,
  //             color: kPrimaryColor,
  //           ),
  //           labelText: 'ชื่อ-นามสกุล',
  //           labelStyle: TextStyle(color: kPrimaryColor)),
  //     ),
  //   );
  // }

  // Widget emailText() {
  //   return Container(
  //     width: 320.0,
  //     child: TextFormField(
  //       obscureText: true,
  //       decoration: InputDecoration(
  //           icon: Icon(
  //             Icons.email,
  //             size: 36.0,
  //             color: kPrimaryColor,
  //           ),
  //           labelText: 'อีเมล์',
  //           labelStyle: TextStyle(color: kPrimaryColor)),
  //     ),
  //   );
  // }

  // Widget phoneText() {
  //   return Container(
  //     width: 320.0,
  //     child: TextFormField(
  //       obscureText: true,
  //       decoration: InputDecoration(
  //           icon: Icon(
  //             Icons.phone,
  //             size: 36.0,
  //             color: kPrimaryColor,
  //           ),
  //           labelText: 'เบอร์โทร์',
  //           labelStyle: TextStyle(color: kPrimaryColor)),
  //     ),
  //   );
  // }

  // Widget loginButton() {
  //   return FloatingActionButton(
  //     backgroundColor: kPrimaryColor,
  //     child: Icon(
  //       Icons.navigate_next,
  //       size: 36.0,
  //     ),
  //     onPressed: () {},
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Container(
            // decoration: BoxDecoration(
            //   gradient: RadialGradient(
            //       colors: [Colors.white, Colors.orange.shade700], radius: 1.0),
            // ),
            child: Stack(
              children: <Widget>[
                backButton(),
                content(),
                // regiscon1(),
                // loginButton(),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kPrimaryColor,
      //   child: Icon(
      //     Icons.navigate_next,
      //     size: 36.0,
      //   ),
      //   onPressed: () {
      //     // register();
      //   },
      // ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // register();
          // register();
          confirmcheck();
        },
        child: Text(
          "สมัครสมาชิก",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: UserregisButtonStyle,
      ),
    );
  }
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
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
