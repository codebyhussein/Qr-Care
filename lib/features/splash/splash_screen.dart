import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/assets/assets_manager.dart';

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
              AppAssets.logoBackgroundBath,
            ),
            fit: BoxFit.cover),
      ),
      child: Center(child: SvgPicture.asset(AppAssets.logoBath)),
    ));
  }

  Future navigateToPage() {
    return Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, Routes.onboardingRoute);
    });
  }
}
