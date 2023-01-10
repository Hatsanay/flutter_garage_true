import 'package:crna_flutter/register/components/usersbody.dart';
import 'package:crna_flutter/register/listregister_screen.dart';
import 'package:flutter/material.dart';

class UserRegisScreen extends StatefulWidget {
  const UserRegisScreen({super.key});

  @override
  State<UserRegisScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserRegisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: regisbody(),
    );
  }
}
