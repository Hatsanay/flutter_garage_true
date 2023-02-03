import 'package:http/http.dart' as http;
import 'dart:convert';

class GarageProvider {
  static Future<List<Map<String, dynamic>>> fetchData() async {
    var url = 'http://192.168.1.106/flutter_login/getlistgarage.php';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((d) => Map<String, dynamic>.from(d)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class machanicProvider {
  static Future<List<Map<String, dynamic>>> fetchData() async {
    var url = 'http://192.168.1.106/flutter_login/getmachanic.php';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((d) => Map<String, dynamic>.from(d)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

// class repairProvider {
//   static Future<List<Map<String, dynamic>>> fetchData() async {
//     var url = 'http://192.168.1.106/flutter_login/getrepair.php';
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return data.map((d) => Map<String, dynamic>.from(d)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }

class repairProvider {
  static Future<List<Map<String, dynamic>>> fetchData(String id) async {
    // var url = 'http://192.168.1.106/flutter_login/getrepair.php';
    // var response = await http.get(Uri.parse(url));
    var url = Uri.http(
        "192.168.1.106", '/flutter_login/getrepair.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "memid": id.toString(),

      // "password": pass.text.toString(),
      // "fullname": fullname.text.toString(),
      // "tel": tel.text.toString(),
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((d) => Map<String, dynamic>.from(d)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class sehgarageProvider {
  static Future<List<Map<String, dynamic>>> fetchData(String garagename) async {
    // var url = 'http://192.168.1.106/flutter_login/getrepair.php';
    // var response = await http.get(Uri.parse(url));
    var url = Uri.http(
        "192.168.1.106", '/flutter_login/getsehgarage.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "garagename": garagename.toString(),

      // "password": pass.text.toString(),
      // "fullname": fullname.text.toString(),
      // "tel": tel.text.toString(),
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((d) => Map<String, dynamic>.from(d)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
