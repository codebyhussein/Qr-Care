import 'package:flutter/material.dart';
import 'package:qr_care/app.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/features/login/injection_container.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  injection.setup();

  runApp(const QrCare());
}
