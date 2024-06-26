import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiUrl {
  //ragaie
  // static const String baseUrl = 'http://192.168.1.4/grd';

  //hussein

  static const String baseUrl = 'https://qrlink.icu';
  // static const String baseUrl = 'http://172.20.10.10/grd';
//  static const String baseUrl = 'https://qrlink.icu';
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
  static const String getUserData = '$baseUrl/user_data.php';
  // static const String getEditData =
  //     '$baseUrl/edit_Accounttt.php?account_id=doctor_6606de58.com';
}
