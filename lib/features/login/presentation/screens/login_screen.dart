import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/core/assets/assets_manager.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/defult_button.dart';
import 'package:qr_care/features/login/presentation/widgets/forget_password_widget.dart';
import 'package:qr_care/features/login/presentation/widgets/sign_up_widget.dart';
import 'package:qr_care/features/login/presentation/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  bool isvisable = false;
  bool isLoading = false;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginLoading) {
          widget.isLoading = true;
        } else if (state is LoginSuccess) {
          AppConst.showMessage(msg: 'login success.', context: context);
          Navigator.pushNamed(context, Routes.homeScreenRoute,
              arguments: state.user);
        } else if (state is LoginFailure) {
          if (state.errorMessage == "كلمة المرور غير صحيحة") {
            errorMessage = "incorrect password";
          } else if (state.errorMessage == "حساب المستخدم غير موجود") {
            errorMessage = "account id is not found";
          } else {
            errorMessage =
                state.errorMessage; // default to original error message
          }
          AppConst.showMessage(msg: errorMessage, context: context);
          widget.isLoading = false;
        }
      }, builder: (context, state) {
        return ModalProgressHUD(
          color: AppColors.mainColor,
          blur: 0.01,
          inAsyncCall: widget.isLoading,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120.h,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        AppAssets.logoBath,
                        height: 192.h,
                        width: 192.w,
                      ),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    AppWidgets.defultText(text: getTranslated("ID", context)!),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      regEx: r'[a-zA-Z]+_[0-9a-fA-F]{8}\.com$',
                      helpText: getTranslated("helpId", context)!,
                      errorMassage: getTranslated("errorValidId", context)!,
                      hintText: getTranslated("ID", context)!,
                      nameofController: idController,
                      isvisble: false,
                      keyBoredType: TextInputType.emailAddress,
                      prefixIcon: const Icon(IconlyLight.profile),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    AppWidgets.defultText(
                        text: getTranslated("passWord", context)!),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      helpText: getTranslated("helperPassWord", context),
                      hintText: getTranslated("passWord", context)!,
                      regEx: AppConst.passwordPattern,
                      errorMassage:
                          getTranslated("errorMessagePassWord", context)!,
                      suffixIcon: IconButton(
                          color: AppColors.mainColor,
                          onPressed: () {
                            setState(() {
                              widget.isvisable = !widget.isvisable;
                            });
                          },
                          icon: widget.isvisable
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_rounded)),
                      nameofController: passwordController,
                      isvisble: !widget.isvisable,
                      keyBoredType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(IconlyLight.lock),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    ForgetPasswordWidget(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.forgetPasswordRoute);
                      },
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Center(
                      child: DefultButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).signIn(
                              id: idController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        text: getTranslated("login", context)!,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SignupWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registerRoute1);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
