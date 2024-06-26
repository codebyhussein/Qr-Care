import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<ForgetpasswordCubit, ForgetpasswordState>(
        listener: (context, state) {
          if (state is ForgetpasswordLoading) {
            isLoading = true;
          } else if (state is ForgetpasswordSuccess) {
            AppConst.showMessage(msg: state.msg, context: context);
            Navigator.pushNamed(context, Routes.resetPasswordRoute);
          } else if (state is ForgetpasswordFailure) {
            AppConst.showMessage(msg: state.errorMessage, context: context);
            isLoading = false;
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            color: AppColors.mainColor,
            blur: 0.01,
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
            ),
          );
        },
      ),
    );
  }
}
