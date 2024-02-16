import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/view/onboarding/onbordingScreen.dart';

class SplahScreen extends StatefulWidget {
  const SplahScreen({super.key});

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    navigateToPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppConst.logo_background_path,
            ),
            fit: BoxFit.cover),
      ),
      child: Center(child: SvgPicture.asset('assets/svg/logo.svg')),
    ));
  }

  Future navigateToPage() {
    return Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const OnBoradingScreen())));
    });
  }
}
