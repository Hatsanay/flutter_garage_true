import 'package:crna_flutter/components/welcome/components/body.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
