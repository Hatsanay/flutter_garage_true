import 'package:flutter_garage_true/components/welcome/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelCome extends StatefulWidget {
  const WelCome({Key? key}) : super(key: key);

  @override
  State<WelCome> createState() => _WelComeState();
}

class _WelComeState extends State<WelCome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: welbody(),
    );
  }
}

// class welcomeScreen extends StatelessWidget {
//   const welcomeScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }
