import 'package:crna_flutter/register/components/listbody.dart';
import 'package:flutter/material.dart';

class listRegisScreen extends StatefulWidget {
  const listRegisScreen({super.key});

  @override
  State<listRegisScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<listRegisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listbody(),
    );
  }
}
