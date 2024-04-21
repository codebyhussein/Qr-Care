import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/Services/notifi_service.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';

import 'package:qr_care/features/forgetPassword/cubit/verificationpassword_cubit.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/resend_code.dart';
import 'package:qr_care/core/injection_container.dart';
import 'package:qr_care/features/widgets/defult_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final sharedPreferences = getIt<SharedPreferences>();
  late String? verificationCode =
      sharedPreferences.getString('verification_code');

  @override
  void initState() {
    showNotifi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<VerificationpasswordCubit, VerificationpasswordState>(
        listener: (context, state) {
          if (state is VerificationpasswordLoading) {
            widget.isLoading = true;
          }
          if (state is VerificationpasswordSuccess) {
            AppConst.showMessage(msg: state.msg, context: context);
            Navigator.pushNamed(context, Routes.changePasswordRoute);
          } else if (state is VerificationpasswordFailure) {
            AppConst.showMessage(msg: state.errorMessage, context: context);
            widget.isLoading = false;
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            color: AppColors.mainColor,
            blur: 0.01,
            inAsyncCall: widget.isLoading,
            child: SingleChildScrollView(
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
                        title: getTranslated("Verification", context)!,
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
                          text: getTranslated("checkDigit", context)!,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Center(
                        child: VerificationCode(
                          fullBorder: true,
                          textStyle:
                              TextStyle(fontSize: 20.sp, color: Colors.black),
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
                          onPressed: () {
                            showNotifi();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 93.h,
                      ),
                      Center(
                          child: DefultButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<VerificationpasswordCubit>(
                                          context)
                                      .verificationFun(code: code!);
                                }
                              },
                              text: getTranslated("ConfirmPassword", context)!))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future showNotifi() async {
    return await NotificationService().showNotification(
      title: 'A new verification code has been sent to your phone number.',
      body: verificationCode,
    );
  }
}
