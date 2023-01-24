// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class repairProvider {
//   static Future<List<Map<String, dynamic>>> fetchData() async {
//     var url = 'http://192.168.1.101/flutter_login/getlistgarage.php';
//     var response = await http.post(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return data.map((d) => Map<String, dynamic>.from(d)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
