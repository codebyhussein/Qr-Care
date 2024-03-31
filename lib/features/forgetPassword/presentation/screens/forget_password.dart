import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/forgetPassword/presentation/screens/verification_screen.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar_forget_password.dart';
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
                  title: 'Forget Password',
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
                    text: 'Forget your password',
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: AppWidgets.defultdesrptionRegister(
                    text: 'Enter Phone number to restore\nyour account',
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                AppWidgets.defultText(text: 'Enter Phone Number'),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  errorMassage: 'please enter a phone number',
                  regEx: AppConst.phonePattern,
                  hintText: 'Enter Phone Number',
                  nameofController: phoneController,
                  isvisble: false,
                  keyBoredType: TextInputType.number,
                  prefixIcon: const Icon(Icons.phone),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Center(
                    child: DefultButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.resetPasswordRoute);
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
