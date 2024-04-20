import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/core/app_color.dart';

import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/register/presentation/cubit/register_cubit.dart';
import 'package:qr_care/features/register/presentation/widgets/Slider.dart';
import 'package:qr_care/features/register/presentation/widgets/custom_appbar_register_screen.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/defult_button.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen2State();
}

class _Screen2State extends State<Screen5> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content:
                    Text('success...', style: TextStyle(color: Colors.white))));
            Navigator.pushNamed(context, Routes.registerRoute6,
                arguments: state.user);
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage,
                    style: const TextStyle(color: Colors.white))));
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          if (state is RegisterLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const CustomAppBarRegister(),
                    CustomSlider(value: 5),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: AppWidgets.defultTextRegister(
                        text: getTranslated("passwordTitlePage", context)!,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                      child: AppWidgets.defultdesrptionRegister(
                          text: getTranslated("passwordDescPage", context)!),
                    ),
                    SizedBox(
                      height: 75.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.defultText(
                              text: getTranslated("password", context)!),
                          SizedBox(
                            height: 6.h,
                          ),
                          CustomTextFormField(
                              regEx: AppConst.passwordPattern,
                              prefixIcon: const Icon(IconlyLight.lock),
                              hintText: getTranslated("password", context)!,
                              errorMassage:
                                  getTranslated("errorNewPassword", context)!,
                              nameofController: passwordController,
                              keyBoredType: TextInputType.visiblePassword,
                              isvisble: false),
                          AppWidgets.defultText(
                              text: getTranslated("confirmPassword", context)!),
                          SizedBox(
                            height: 6.h,
                          ),
                          CustomTextFormField(
                              regEx: AppConst.passwordPattern,
                              prefixIcon: const Icon(IconlyLight.lock),
                              hintText:
                                  getTranslated("confirmPassword", context)!,
                              errorMassage:
                                  getTranslated("errorNewPassword", context)!,
                              nameofController: confirmpasswordController,
                              keyBoredType: TextInputType.visiblePassword,
                              isvisble: false),
                          SizedBox(
                            height: 160.h,
                          ),
                        ],
                      ),
                    ),
                    DefultButton(
                      text: getTranslated("next", context)!,
                      onPressed: () async {
                        String gender =
                            await CacheHelper.getData(key: 'gender');
                        String nationalId =
                            await CacheHelper.getData(key: 'nationalId');
                        String job = await CacheHelper.getData(key: 'jop');
                        String image =
                            await CacheHelper.getData(key: 'idImagePath');
                        String governorateId =
                            await CacheHelper.getData(key: 'governorate');
                        String center =
                            await CacheHelper.getData(key: 'center');
                        String city = await CacheHelper.getData(key: 'city');
                        String emergencyName =
                            await CacheHelper.getData(key: 'emergncy_name');

                        String contact =
                            await CacheHelper.getData(key: 'contact');
                        String mobile =
                            await CacheHelper.getData(key: 'mobile');
                        if (passwordController.text ==
                            confirmpasswordController.text) {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context).signUp(
                                nationalId: nationalId,
                                gender: gender,
                                job: job,
                                governmentCity: city,
                                governmentCenter: center,
                                contact: contact,
                                emergencyContact: mobile,
                                password: passwordController.text,
                                confirmPassword: confirmpasswordController.text,
                                emergencyName: emergencyName,
                                governmentNum: governorateId,
                                file: File(image),
                                city: city);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
