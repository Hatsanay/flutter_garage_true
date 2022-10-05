import 'package:crna_flutter/components/home/home_screen.dart';
import 'package:crna_flutter/components/login/login.dart';
import 'package:crna_flutter/components/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRNA',
      // home: loginPage(),
      // home: loginPage(),
      home: WelCome(),
      // home: HomeScreen(),
    );
  }
}
