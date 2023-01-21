// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class garage1 {
//   final String name;
//   final String type;
//   final String shortDesc;
//   final String desc;
//   final String image;
//   final int rate;
//   final int price;

//   garage1(
//       {required this.name,
//       required this.type,
//       required this.shortDesc,
//       required this.desc,
//       required this.image,
//       required this.rate,
//       required this.price});
// }

// List<garage1> garage = [
//   garage1(
//       name: "",
//       type: '',
//       shortDesc: " ",
//       desc: " ",
//       image: "",
//       rate: 5,
//       price: 2),
// ];

// class Coffee {
//   final String name;
//   final String type;
//   final String shortDesc;
//   final String desc;
//   final String image;
//   final int rate;
//   final int price;

//   Coffee(
//       {required this.name,
//       required this.type,
//       required this.shortDesc,
//       required this.desc,
//       required this.image,
//       required this.rate,
//       required this.price});
// }

// List<Coffee> menu;

// Future getCoffeeData() async {
//   var url = 'http://192.168.1.101/flutter_login/getlistcoffee.php';
//   var response = await http.get(Uri.parse(url));
//   var data = jsonDecode(response.body);
//   var garage = data
//       .map<garage1>((json) => garage1(
//           name: json["garagename"],
//           type: json["garagename"],
//           shortDesc: json["garagelattitude"],
//           desc: json["garagename"],
//           image: json["garagename"],
//           rate: json["garagename"],
//           price: json["garagename"]))
//       .toList();
//   return garage;
// }
