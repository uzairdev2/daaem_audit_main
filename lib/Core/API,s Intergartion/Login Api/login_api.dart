// ignore_for_file: avoid_print

import 'package:daaem_reports/Core/Routes/routes_name.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  String apiUrl = 'https://www.daaemsolutions.com/test/audit_api/login/';

  Future<void> loginUser(String username, String password) async {
    print("function is called");
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Login successful
        print('Login successful!');
        Get.toNamed(RoutesName.homeScreen);
      } else {
        // Login failed
        print('Login failed. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }
}
