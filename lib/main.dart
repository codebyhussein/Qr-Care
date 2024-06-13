import 'package:flutter/material.dart'; //
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_care/app.dart';
import 'package:qr_care/core/BlocObserve.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/core/Services/notifi_service.dart';
import 'package:qr_care/core/ServicesLocator.dart';
import 'package:qr_care/core/injection_container.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  injection.setup();
  await NotificationService().initNotification();
  ServicesLocator.setupServiceLocator();
  ServicesLocator.setupServicesData();
  runApp(const QrCare());
}
