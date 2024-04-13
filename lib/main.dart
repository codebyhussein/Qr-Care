import 'package:flutter/material.dart';
import 'package:qr_care/app.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';

<<<<<<< HEAD
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
=======
 
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var url = Uri.parse('http://10.0.2.2/grd/auth/login.php');
  var response = await http.post(url,
      body: {'account_id': 'doctor_6606de58.com', 'password': '1234'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
 
>>>>>>> bcdc97f29adf2fd19fd3c9bfa06f47e2d35979bb
  runApp(const QrCare());
}
