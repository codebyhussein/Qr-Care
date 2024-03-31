import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/register/presentation/widgets/CustomUpload.dart';
import 'package:qr_care/features/register/presentation/widgets/Slider.dart';
import 'package:qr_care/features/register/presentation/widgets/custom_appbar_register_screen.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/defult_button.dart';
import 'package:qr_care/features/widgets/dropdwan_button.dart';

class Screen2 extends StatefulWidget {
  Screen2({super.key});
  bool isLoading = false;
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController idController = TextEditingController();
  TextEditingController jopController = TextEditingController();
// Obtain shared preferences.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const CustomAppBarRegister(),
              CustomSlider(value: 2),
              SizedBox(
                height: 30.h,
              ),
              AppWidgets.defultTextRegister(
                text: 'What is Your ID number and\nyour job?',
              ),
              SizedBox(
                height: 15.h,
              ),
              AppWidgets.defultdesrptionRegister(
                  text:
                      'Please, for better experience provide us\nwith this further information'),
              Padding(
                padding: EdgeInsets.only(top: 50.h, left: 15.w),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AppWidgets.defultText(text: 'ID Number'),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomTextFormField(
                    hintText: "ID",
                    helpText: 'ID Must be 14 digits',
                    errorMassage: 'Please Enter ID Number',
                    regEx: AppConst.idPattern,
                    nameofController: idController,
                    keyBoredType: TextInputType.number,
                    isvisble: false),
              ),
              const CustomUpload(),
              Padding(
                padding: EdgeInsets.only(top: 19.h, left: 15.w),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AppWidgets.defultText(text: 'JOP'),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              DefaultDropdown(
                  hintText: 'Choose a job',
                  errorMassage: 'Please Choose a job',
                  controllerName: jopController,
                  listName: AppConst.jops,
                  onChanged: (value) {
                    jopController.text = value!;
                  }),
              SizedBox(
                height: 85.h,
              ),
              DefultButton(
                text: "Next",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.registerRoute3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
