import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class ApiProvider {
  ApiProvider();
  String endPoint = 'http://192.168.1.105:3000';
  Future<http.Response> doLogin(String username, String password) async {
    String _url = '$endPoint/login';
    String test = 'testdd';
    var body = {"username": username, "password": password};
    // return http.post(_url, body: body);
    return http.post(Uri.parse(_url), body: body);
  }
}
//endPoint --ต้องแปลี่ยนเป็นของเครื่องมรารันถ้าอัพขึ้นโปรดักชั้นให้เปลี่ยนเป็นDNS