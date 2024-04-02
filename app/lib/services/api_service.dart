import 'dart:convert';
import 'package:meyaa/models/login_response_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<LoginResponseModel> otpLogin(String email) async {
    var url = Uri.http("10.0.2.2:4500", "/api/otp-login"); //127.0.0.1:4500

    var response = await client.post(
      url,
      headers: {'Content-type': "application/json"},
      body: jsonEncode(
        {"email": email},
      ),
    );

    return loginResponseModel(response.body);
  }

  static Future<http.Response> verifyOTP(
      String email, String otpHash, String otpCode) async {
    var url = Uri.http("10.0.2.2:4500", "/api/otp-verify");

    var response = await client.post(
      url,
      headers: {'Content-type': "application/json"},
      body: jsonEncode(
        {
          "email": email,
          "otp": otpCode,
          "hash": otpHash,
        },
      ),
    );

    return response;
  }

  // ///for test retrieving data
  // Future<List<dynamic>> fetchData() async {
  //   const url = "http://10.0.2.2:4500/data";

  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     // Parse the JSON response
  //     return jsonDecode(response.body) as List<dynamic>;
  //   } else {
  //     // Handle error
  //     throw Exception('Failed to load data');
  //   }
  // }
}
