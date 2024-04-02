import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar_forget_password.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/resend_code.dart';
import 'package:qr_care/features/widgets/defult_button.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({super.key});
  bool isLoading = false;
  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? code;
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
                  title: 'Verification',
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/forgetpassword2.png',
                    height: 228.h,
                    width: 248.w,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: AppWidgets.defultTextRegister(
                    text: 'Please check phone a\n4 digit code',
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Center(
                  child: VerificationCode(
                    fullBorder: true,
                    textStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
                    keyboardType: TextInputType.number,
                    underlineColor: const Color(0xff004854),
                    fillColor: Colors.white,
                    length: 4,
                    cursorColor: AppColors.mainColor,
                    onCompleted: (String value) {
                      setState(() {
                        code = value;
                      });
                    },
                    onEditing: (bool value) {},
                    // onEditing: (bool value) {
                    //   setState(() {
                    //     _onEditing = value;
                    //   });
                    //   if (!_onEditing) FocusScope.of(context).unfocus();
                    // },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: ResendCodeWidget(
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 93.h,
                ),
                Center(
                    child: DefultButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.changePasswordRoute);
                        },
                        text: 'Send'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
