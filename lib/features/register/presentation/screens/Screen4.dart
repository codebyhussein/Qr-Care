import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/register/presentation/widgets/Slider.dart';
import 'package:qr_care/features/register/presentation/widgets/custom_appbar_register_screen.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/defult_button.dart';

class Screen4 extends StatefulWidget {
  Screen4({super.key});
  bool isLoading = false;
  @override
  State<Screen4> createState() => _Screen2State();
}

class _Screen2State extends State<Screen4> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const CustomAppBarRegister(),
              CustomSlider(value: 4),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: AppWidgets.defultTextRegister(
                  text: getTranslated("emergencyContacts", context)!,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: AppWidgets.defultdesrptionRegister(
                    text:
                    getTranslated("descEmergencyContact", context)!),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.defultText(text:  getTranslated("contact", context)!),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomTextFormField(
                        regEx: AppConst.phonePattern,
                        prefixIcon: const Icon(IconlyLight.call),
                        hintText:  getTranslated("phone", context)!,
                        errorMassage: getTranslated("errorMessagePhone", context)!,
                        nameofController: phoneController,
                        keyBoredType: TextInputType.number,
                        isvisble: false),
                    AppWidgets.defultText(text: getTranslated("emergencyContact", context)! ),
                    SizedBox(
                      height: 6.h,
                    ),
                    CustomTextFormField(
                        regEx: r'^[A-Za-z]+$',
                        prefixIcon: const Icon(IconlyLight.profile),
                        hintText:  getTranslated("name", context)! ,
                        errorMassage:  getTranslated("errorMessageName", context)! ,
                        nameofController: nameController,
                        keyBoredType: TextInputType.text,
                        isvisble: false),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppWidgets.defultText(text: getTranslated("mobile", context)!),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      regEx: AppConst.phonePattern,
                      prefixIcon: const Icon(IconlyLight.call),
                      hintText: getTranslated("phone", context)!,
                      errorMassage:
                      getTranslated("errorMessageEmergency", context)!,
                      nameofController: MobileController,
                      keyBoredType: TextInputType.number,
                      isvisble: false,
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                  ],
                ),
              ),
              DefultButton(
                text: 'Next',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.registerRoute5);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
