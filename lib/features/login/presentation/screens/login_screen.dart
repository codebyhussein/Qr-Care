import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
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
import 'package:qr_care/features/widgets/failure_widget.dart';
import 'package:qr_care/features/widgets/loading_widget.dart';
import 'package:qr_care/features/widgets/success_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  bool isvisable = false;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          SuccessWidget(
            text: "login success",
          );
          Navigator.pushNamed(context, Routes.homeScreenRoute);
        } else if (state is LoginFailure) {
          FailureWidget(text: state.errorMessage);
        } else if (state is LoginLoading) {
          const LoadingWidget();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Padding(
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
                        AppAssets.logo_Path,
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
                      errorMassage: getTranslated("errorValid", context)!,
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
      },
    );
  }
}
