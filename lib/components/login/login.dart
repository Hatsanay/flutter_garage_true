import 'dart:convert';
import 'package:crna_flutter/components/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crna_flutter/components/login/api_provider.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'api_provider.dart';

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<loginPage> {
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ApiProvider apiProvider = ApiProvider();

  Future doLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        var rs =
            await apiProvider.doLogin(_ctrlUsername.text, _ctrlPassword.text);
        if (rs.statusCode == 200) {
          print(rs.body);
          var jsonRes = json.decode(rs.body);
          if (jsonRes['ok']) {
            String token = jsonRes['token'];
            print(token);
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString(token, token);
            //redirect
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeScreen(
                      title: 'หน้าแรก',
                    )));
          } else {
            print(jsonRes['error']);
          }
        } else {
          print('การเชื่อมต่อเซฟเวอร์ผิดพลาด');
        }
      } catch (error) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                    fontSize: 30,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดกรอกชื่อผู้ใช้(Username)!';
                  }
                  return null;
                },
                controller: _ctrlUsername,
                decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    labelText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 3, left: 15, right: 15, bottom: 20),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดกรอกรหัสผ่าน(Password)!';
                  }
                  return null;
                },
                obscureText: true,
                controller: _ctrlPassword,
                decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            ElevatedButton(
              onPressed: () => doLogin(),
              child: Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              style: LoginButtonStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'facebook',
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                style: LogfaceButtonStyle,
              ),
            ),
          ],
        ),
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

final ButtonStyle LogfaceButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black,
  primary: Colors.blue,
  minimumSize: Size(90, 50),
  padding: EdgeInsets.symmetric(horizontal: 140),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
