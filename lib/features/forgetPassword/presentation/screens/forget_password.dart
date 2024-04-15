import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/forgetPassword/cubit/forgetpassword_cubit.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/defult_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

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
      body: BlocConsumer<ForgetpasswordCubit, ForgetpasswordState>(
        listener: (context, state) {
          if (state is ForgetpasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.msg,
                    style: const TextStyle(color: Colors.white))));
            Navigator.pushNamed(context, Routes.resetPasswordRoute);
          } else if (state is ForgetpasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage,
                    style: const TextStyle(color: Colors.white))));
          }
        },
        builder: (context, state) {
          if (state is ForgetpasswordLoading) {
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
                        // if (widget.isLoading)
                        //   Center(
                        //     child: SizedBox(
                        //       height: 25.h,
                        //       width: 25.w,
                        //       child: CircularProgressIndicator(
                        //         backgroundColor: Colors.transparent,
                        //         color: AppColors.mainColor,
                        //       ),
                        //     ),
                        //   ),
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
                    Center(
                      child: DefultButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<ForgetpasswordCubit>(context)
                                .forgotPassword(
                                    phoneNumber: phoneController.text);
                          }
                        },
                        text: getTranslated("Send", context)!,
                      ),
                    ),
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
