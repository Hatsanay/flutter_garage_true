import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';

class homeBody extends StatefulWidget {
  const homeBody({Key? key}) : super(key: key);

  @override
  State<homeBody> createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          // margin: new EdgeInsets.symmetric(horizontal: 10.0),
          margin: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 15.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: kPrimaryColor,
              style: BorderStyle.solid,
              // width: 8.0,
              width: 90,
            ),
            borderRadius: BorderRadius.circular(20.0),
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
