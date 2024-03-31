import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/core/assets/assets_manager.dart';
import 'package:qr_care/features/register/presentation/widgets/CustomImage.dart';
import 'package:qr_care/features/register/presentation/widgets/Slider.dart';
import 'package:qr_care/features/register/presentation/widgets/custom_appbar_register_screen.dart';
import 'package:qr_care/features/widgets/defult_button.dart';

class Screen1 extends StatefulWidget {
  Screen1({super.key});
  bool isMale = true;
  bool isLoading = false;
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBarRegister(),
            CustomSlider(value: 1),
            SizedBox(
              height: 30.h,
            ),
            AppWidgets.defultTextRegister(
              text: 'What is Your gender?',
            ),
            SizedBox(
              height: 15.h,
            ),
            AppWidgets.defultdesrptionRegister(
                text:
                    'Please, for better experience provide us\nwith this further information'),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        widget.isMale = !widget.isMale;
                      });
                    },
                    child: CustomImage(
                      isMale: widget.isMale,
                      text: 'Male',
                      imageUrl: AppAssets.male,
                      color: const Color.fromRGBO(
                          70, 149, 164, 0.9200000166893005),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        widget.isMale = !widget.isMale;
                      });
                    },
                    child: CustomImage(
                      isMale: !widget.isMale,
                      text: 'Female',
                      imageUrl: AppAssets.female,
                      color: const Color.fromRGBO(
                          220, 76, 137, 0.36000001430511475),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
            SizedBox(
              height: 170.h,
            ),
            DefultButton(
              text: 'Next',
              onPressed: () {
                Navigator.pushNamed(context, Routes.registerRoute2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
