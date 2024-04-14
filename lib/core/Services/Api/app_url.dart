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
}
