import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/routes/app_routes.dart';

import 'package:qr_care/config/themes/app_themes.dart';

import 'package:qr_care/features/splash/splash_screen.dart';

class QrCare extends StatelessWidget {
  const QrCare({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          onGenerateRoute: AppRoutes.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          home: const SplahScreen(),
          theme: appthemes(),
        );
      },
    );
  }
}
