import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/view/onboarding/screens/screen1.dart';
import 'package:qr_care/view/onboarding/screens/screen2.dart';
import 'package:qr_care/view/onboarding/screens/screen3.dart';
import 'package:qr_care/view/onboarding/widgets/smooth_page_indicator.dart';
import 'package:qr_care/view/widgets/defult_button.dart';

import 'widgets/custom_appbar.dart';

class OnBoradingScreen extends StatefulWidget {
  const OnBoradingScreen({super.key});

  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  final controller = PageController();

  bool isLastPage = false;
  bool isFirstPage = true;

  @override
  void initState() {
    navigateView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 61.h,
            ),
            CustomAppBarAppOnboardingScreen(
              controller: controller,
              isLastPage: isLastPage,
              isFirstPage: isFirstPage,
            ),
            SizedBox(
              height: 520.h,
              child: PageView(
                allowImplicitScrolling: true,
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    isLastPage = value == 2;
                    isFirstPage = value == 0;
                  });
                },
                children: const [
                  Screen1(),
                  Screen2(),
                  Screen3(),
                ],
              ),
            ),
            SizedBox(
              height: 44.h,
            ),
            isLastPage
                ? Padding(
                    padding: EdgeInsets.only(
                      left: 30.w,
                      right: 30.w,
                    ),
                    child: Column(
                      children: [
                        Smooth_Page_Indicator(
                          controller: controller,
                        ),
                        SizedBox(
                          height: 49.h,
                        ),
                        DefultButton(
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(
                              //   builder: (context) {
                              //     return LoginScreen();
                              //   },
                              // ));
                            },
                            text: 'Get Stared')
                      ],
                    ))
                : Smooth_Page_Indicator(
                    controller: controller,
                  ),
          ],
        ),
      ),
    );
  }

  void navigateView() {
    for (int i = 0; i < 2; i++) {
      Future.delayed(Duration(seconds: 3 * (i + 1)), () {
        int nextPage = controller.page!.round() + 1;

        if (nextPage < 3) {
          controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
        } else {
          controller.jumpToPage(0);
        }
      });
    }
  }
}
