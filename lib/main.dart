import 'package:flutter/material.dart';
import 'package:qr_care/app.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const QrCare());
}
