// import 'package:crna_flutter/components/home/components/garageModel.dart';
// import 'package:flutter/material.dart';

// import 'garageItemcard.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class GarageProvider {
//   static Future<List<Map<String, dynamic>>> fetchData() async {
//     var url = 'http://192.168.1.101/flutter_login/getlistcoffee.php';
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return data.map((d) => Map<String, dynamic>.from(d)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }

// class HotCoffeePage extends StatelessWidget {
//   final List<garage1> garage;
//   HotCoffeePage({required this.garage});
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: GarageProvider.fetchData(),
//       builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
//         if (snapshot.hasData) {
//           return Container(
//             child: ListView.builder(
//               itemCount: snapshot.data?.length,
//               itemBuilder: (context, int index) {
//                 return MenuItemCard(garage: snapshot.data![index]);
//               },
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Center(child: Text("${snapshot.error}"));
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
