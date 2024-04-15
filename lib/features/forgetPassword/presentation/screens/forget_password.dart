import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/defult_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({super.key});
  bool isLoading = false;

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                CustomAppBar(
                  title: getTranslated("ForgetPassword", context)!,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/forgetpassword1.png',
                    height: 228.h,
                    width: 248.w,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: AppWidgets.defultTextRegister(
                    text: getTranslated("Forgetyourpassword", context)!,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: AppWidgets.defultdesrptionRegister(
                        text: getTranslated("descPhoneNumber", context)!,
                      ),
                    ),
                    if (widget.isLoading)
                      Center(
                        child: SizedBox(
                          height: 25.h,
                          width: 25.w,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                  ],
                ),

                SizedBox(
                  height: 30.h,
                ),
                AppWidgets.defultText(
                    text: getTranslated("EnterPhoneNumber", context)!),
                SizedBox(
                  height: 10.h,
                ),

                CustomTextFormField(
                  errorMassage:
                      getTranslated("errorMessagePhoneNumber", context)!,
                  regEx: AppConst.phonePattern,
                  hintText: getTranslated("EnterPhoneNumber", context)!,
                  nameofController: phoneController,
                  isvisble: false,
                  keyBoredType: TextInputType.number,
                  prefixIcon: const Icon(Icons.phone),
                ),
                SizedBox(
                  height: 80.h,
                ),
                // Center(
                //     child: DefultButton(
                //         onPressed: () {
                //           if (formKey.currentState!.validate()) {
                //             Navigator.pushNamed(
                //                 context, Routes.resetPasswordRoute);
                //           }
                //         },
                //         text: getTranslated("Send", context)!)),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      DefultButton(
                        onPressed: () async {
                          setState(() {
                            widget.isLoading = true;
                          });

                          if (formKey.currentState!.validate()) {
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            Navigator.pushNamed(
                                context, Routes.resetPasswordRoute);
                          }

                          setState(() {
                            widget.isLoading = false;
                          });
                        },
                        text: getTranslated("Send", context)!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
