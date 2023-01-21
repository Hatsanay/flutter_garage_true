import 'dart:async';

import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class repairBody extends StatelessWidget {
  final Map<String, dynamic> garage;
  const repairBody(
      {Key? key,
      required String username,
      required String id,
      required String proflie,
      required this.garage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Text(garage['garagename']),
        )
      ],
    );
  }
}
