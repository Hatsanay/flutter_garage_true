import 'package:crna_flutter/components/home/components/listProvider.dart';
import 'package:crna_flutter/components/home/components/garageItemcard.dart';
import 'package:crna_flutter/components/home/components/machanicItemcard.dart';
import 'package:crna_flutter/components/list/components/itemrepair.dart';
import 'package:crna_flutter/constans.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class listBody extends StatefulWidget {
  final String username;
  final String id;
  final String proflie;

  listBody(
      {Key? key,
      required this.username,
      required this.id,
      required this.proflie})
      : super(key: key);
  @override
  State<listBody> createState() => _homeBodyState();
}

class _homeBodyState extends State<listBody> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          child: Container(
        height: height * 0.8,
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: repairProvider.fetchData(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return itemrepair(
                    garage: snapshot.data![index],
                    id: widget.id,
                    proflie: widget.proflie,
                    title: '',
                    username: widget.username,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(""));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      )),
    ));
  }
}
