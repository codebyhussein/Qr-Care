import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/forgetPassword/cubit/resetpassword_cubit.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar.dart';
import 'package:qr_care/features/login/injection_container.dart';

import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/defult_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<ResetpasswordCubit, ResetpasswordState>(
        listener: (context, state) {
          if (state is ResetpasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.msg,
                    style: const TextStyle(color: Colors.white))));
            Navigator.pushNamed(context, Routes.loginRoute);
          } else if (state is ResetpasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage,
                    style: const TextStyle(color: Colors.white))));
          }
        },
        builder: (context, state) {
          if (state is ResetpasswordLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
            );
          }
          return SingleChildScrollView(
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
                      title: getTranslated("ChangePassword", context)!,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/forgetpassword3.png',
                        height: 228.h,
                        width: 248.w,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: AppWidgets.defultTextRegister(
                        text: getTranslated("resetPassword", context)!,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      hintText: getTranslated("NewPassword", context)!,
                      nameofController: newPasswordController,
                      errorMassage: getTranslated("errorNewPassword", context)!,
                      regEx: AppConst.passwordPattern,
                      isvisble: false,
                      keyBoredType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(IconlyLight.lock),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      hintText: getTranslated("ConfirmPassword", context)!,
                      nameofController: confirmPasswordController,
                      errorMassage: getTranslated("errorConfirm", context)!,
                      regEx: AppConst.passwordPattern,
                      isvisble: false,
                      keyBoredType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(IconlyLight.lock),
                    ),
                    SizedBox(
                      height: 87.h,
                    ),
                    Center(
                        child: DefultButton(
                            onPressed: () {
                              final sharedPreferences =
                                  getIt<SharedPreferences>();
                              String? verificationCode = sharedPreferences
                                  .getString('verification_code');
                              String? phoneNumber =
                                  sharedPreferences.getString('phone_number');
                              if (formKey.currentState!.validate()) {
                                {
                                  BlocProvider.of<ResetpasswordCubit>(context)
                                      .resetPassword(
                                          newPassword:
                                              newPasswordController.text,
                                          confirmPassword:
                                              confirmPasswordController.text,
                                          verificationCode: verificationCode!,
                                          phoneNumber: phoneNumber!);
                                }
                              }
                            },
                            text: getTranslated("Send", context)!))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
