import 'package:http/http.dart' as http;
import 'dart:convert';

class Coffee {
  final String name;
  final String type;
  final String shortDesc;
  final String desc;
  final String image;
  final int rate;
  final int price;

  Coffee(
      {required this.name,
      required this.type,
      required this.shortDesc,
      required this.desc,
      required this.image,
      required this.rate,
      required this.price});
}

List<Coffee> menu = [
  Coffee(
      name: "หัสนัยอู่",
      type: 'Hot',
      shortDesc: "คะแนน 9",
      desc: " ",
      image: "assets\images\test1.png",
      rate: 5,
      price: 2),
  Coffee(
      name: "หัสนัยอู่",
      type: 'Hot',
      shortDesc: "คะแนน 9",
      desc: " ",
      image: "assets\images\test1.png",
      rate: 5,
      price: 2),
  Coffee(
      name: "หัสนัยอู่",
      type: 'Hot',
      shortDesc: "คะแนน 9",
      desc: " ",
      image: "assets\images\test1.png",
      rate: 5,
      price: 2),
  Coffee(
      name: "หัสนัยอู่",
      type: 'Hot',
      shortDesc: "คะแนน 9",
      desc: " ",
      image: "assets\images\test1.png",
      rate: 5,
      price: 2),
];



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
//   menu = data
//       .map<Coffee>((json) => Coffee(
//           name: json["garagename"],
//           type: json["garagename"],
//           shortDesc: json["garagelattitude"],
//           desc: json["garagename"],
//           image: json["garagename"],
//           rate: json["garagename"],
//           price: json["garagename"]))
//       .toList();
//   return menu;
// }
