import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/core/assets/assets_manager.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/defult_button.dart';
import 'package:qr_care/features/login/presentation/widgets/forget_password_widget.dart';
import 'package:qr_care/features/login/presentation/widgets/sign_up_widget.dart';

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
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              AppWidgets.defultText(text: 'ID'),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                regEx: r'\w+\d{4}\.com$',
                helpText: "like : username****.com",
                errorMassage: 'Please enter a vaild App ID',
                hintText: 'App ID',
                nameofController: idController,
                isvisble: false,
                keyBoredType: TextInputType.emailAddress,
                prefixIcon: const Icon(IconlyLight.profile),
              ),
              SizedBox(
                height: 23.h,
              ),
              AppWidgets.defultText(text: 'Password'),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                helpText:
                    "Min. 8 chars, 1 upper, 1 lower, 1 number, 1 special char.",
                hintText: 'Password',
                regEx: AppConst.passwordPattern,
                errorMassage: 'Please enter a vaild password',
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
              ForgetPasswordWidget(onPressed: () {
                Navigator.pushNamed(context, Routes.forgetPasswordRoute);
              }),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: DefultButton(
                  onPressed: () {
                    // if (formKey.currentState!.validate()) {}
                    Navigator.pushNamed(context, Routes.homeScreenRoute);
                  },
                  text: 'login',
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
            ]),
          ),
        ),
      ),
    );
  }
}
