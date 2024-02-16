import 'package:flutter/material.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Smooth_Page_Indicator extends StatelessWidget {
  const Smooth_Page_Indicator({super.key, required this.controller});
  final controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SmoothPageIndicator(
        controller: controller,
        onDotClicked: (index) {
          controller.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        },
        count: 3,
        effect: WormEffect(
            dotWidth: 15.0,
            dotHeight: 15.0,
            dotColor: const Color(0xffD9D9D9),
            type: WormType.thinUnderground,
            activeDotColor: AppColors.mainColor),
      ),
    );
  }
}
