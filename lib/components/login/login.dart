import 'dart:convert' show jsonDecode;

import 'package:flutter_garage_true/components/home/home_screen.dart';
import 'package:flutter_garage_true/components/login/api_provider.dart';
import 'package:flutter_garage_true/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();
  String apiUrl = Api.url;

  String msgError = "";

  getApi(String username, String password) async {
    final res = await http.post(Uri.parse(apiUrl), body: {
      "username": username,
      "password": password,
    });
    final data = jsonDecode(res.body);

    if (data['level'] == "2") {
      print(data['msg'] +
              " dan status : " +
              data['level'] +
              data['fullname'] +
              data['id'] +
              data['proflie']
          // data['garagename'] +
          // data['garagetel'] +
          // data['garagelattitude'] +
          // data['garagelonggitude'] +
          // data['garageprofile'] +
          // data['garageonoff'] +
          // data['ownerid'] +
          // data['garagedeegree']
          );
      Navigator.of(context).push(MaterialPageRoute(
        builder: (c) => HomeScreen(
          username: data['fullname'],
          id: data['id'],
          proflie: data['proflie'],
          title: 'หน้าแรก',
          garageid: data['garageid1'],
          garagename: data['garagename'],
          garagetel: data['garagetel'],
          garagelattitude: data['garagelattitude'],
          garagelonggitude: data['garagelonggitude'],
          garageprofile: data['garageprofile'],
          garageonoff: data['garageonoff'],
          ownerid: data['ownerid'],
          garagedeegree: data['garagedeegree'],
        ),
      ));
      _ctrlUsername.clear();
      _ctrlPassword.clear();
      setState(() {
        msgError = "";
      });
      // }
      // else if (data['level'] == "user") {
      //   print(data['msg'] + " dan status : " + data['level']);
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: (c) => HomePage(username: data['username'])));
      //   _ctrlUsername.clear();
      //   _ctrlPassword.clear();
      //   setState(() {
      //     msgError = "";
      //   });
    } else {
      setState(() {
        msgError = "Username atau Password Salah";
      });
    }
  }

  bool _isVisible = false;

  //Explict

  //Method
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

//หัวข้อ
  Widget content() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          showAppName(),
          usernameText(),
          passwordText(),
        ],
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
      height: 150.0,
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
            return 'โปรดกรอกชื่อผู้ใช้(Username)!';
          }
          return null;
        },
        controller: _ctrlUsername,
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

  Widget passwordText() {
    return Container(
      width: 320.0,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'โปรดกรอกรหัสผ่าน(Password)!';
          }
          return null;
        },
        controller: _ctrlPassword,
        obscureText: !_isVisible,
        decoration: InputDecoration(
            suffixIcon: visible(),
            icon: Icon(
              Icons.lock,
              size: 36.0,
              color: kPrimaryColor,
            ),
            labelText: 'Password',
            labelStyle: TextStyle(color: kPrimaryColor)),
      ),
    );
  }

  Widget loginButton() {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      child: Icon(
        Icons.navigate_next,
        size: 36.0,
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 130),
            child: Container(
              // decoration: BoxDecoration(
              //   gradient: RadialGradient(
              //       colors: [Colors.white, Colors.orange.shade700], radius: 1.0),
              // ),
              child: Stack(
                children: <Widget>[
                  backButton(),
                  content(),
                  // loginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.navigate_next,
          size: 36.0,
        ),
        onPressed: () {
          getApi(_ctrlUsername.text, _ctrlPassword.text);
        },
      ),
    );
  }
}
