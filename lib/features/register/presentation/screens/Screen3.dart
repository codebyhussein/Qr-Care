import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/register/presentation/widgets/Slider.dart';
import 'package:qr_care/features/register/presentation/widgets/custom_appbar_register_screen.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/defult_button.dart';
import 'package:qr_care/features/widgets/dropdwan_button.dart';

class Screen3 extends StatefulWidget {
  Screen3({super.key});
  bool isLoading = false;
  @override
  State<Screen3> createState() => _Screen2State();
}

class _Screen2State extends State<Screen3> {
  TextEditingController idController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController centerController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const CustomAppBarRegister(),
              CustomSlider(value: 3),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: AppWidgets.defultTextRegister(
                  text: 'What is Your address?',
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: AppWidgets.defultdesrptionRegister(
                    text:
                        'Please, for better experience provide us\nwith this further information'),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.defultText(text: 'Governorate'),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                        errorMassage: 'Please Enter ID Number',
                        hintText: "ID",
                        helpText: 'This is a 3-digit number that identifies ',
                        regEx: AppConst.governoratePattern,
                        nameofController: idController,
                        keyBoredType: TextInputType.number,
                        isvisble: false),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppWidgets.defultText(text: 'City'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: DefaultDropdown(
                          hintText: 'Select city',
                          errorMassage: 'Please Select city',
                          controllerName: cityController,
                          listName: AppConst.cities,
                          onChanged: (value) {
                            cityController.text = value!;
                          }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppWidgets.defultText(text: 'Center'),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              Center(
                child: DefaultDropdown(
                    hintText: 'Select center',
                    errorMassage: 'Please Select Center',
                    controllerName: cityController,
                    listName: AppConst.cities,
                    onChanged: (value) {
                      cityController.text = value!;
                    }),
              ),
              SizedBox(
                height: 85.h,
              ),
              Center(
                child: DefultButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.registerRoute4);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
