import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiUrl {
  static const String baseUrl = 'http://10.0.2.2/grd';

  static const String loginUrl = '$baseUrl/auth/login.php';
  static const String registerUrl = '$baseUrl/auth/signup.php';
  static const String addChildUrl = '$baseUrl/add_Child.php';
  static const String editAccountUrl = '$baseUrl/edit_Account.php';
  static const String personalInforamationUrl =
      '$baseUrl/personal_information.php';
  static const String medicalInforamationUrl =
      '$baseUrl/medical_information.php';
  static const String forgetPasswordUrl = '$baseUrl/forgot_password.php';
  static const String resetPasswordUrl = '$baseUrl/reset_password.php';

  static Future<http.MultipartRequest> postData(
      {required String endPoint}) async {
    var response = http.MultipartRequest("Post", Uri.parse(endPoint));
    return response;
  }

  static Future<http.Response> postRequest(
      {required String body,
      required Map<String, String> header,
      required String endPoint}) async {
    var response =
        await http.post(Uri.parse(endPoint), body: body, headers: header);
    return response;
  }
}
