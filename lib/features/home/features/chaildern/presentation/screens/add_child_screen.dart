import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar_forget_password.dart';
import 'package:qr_care/features/register/presentation/widgets/CustomUpload.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';

import '../../../../../widgets/defult_button.dart';

class AddChildScreen extends StatefulWidget {
  AddChildScreen({super.key});
  bool isLoading = false;
  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  TextEditingController idController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 31.h,
              ),
              CustomAppBar(title: 'First Child Data'),
              SizedBox(
                height: 117.h,
              ),
              AppWidgets.defultText(text: 'Choose image'),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () async {
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      value = File(pickedFile.path);
                    });
                  }
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: const Color(0xffD9D9D9),
                  child: value == null
                      ? const Center(
                          child: Text(
                            'Upload',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat meduim'),
                          ),
                        )
                      : CircleAvatar(
                          radius: 75,
                          backgroundImage: FileImage(File(value!.path)),
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 233.w),
                child: Text(
                  'ID number',
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 72, 84, 1),
                    fontFamily: 'Montserrat semibold',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomTextFormField(
                  helpText: 'ID Must be 14 digits',
                  errorMassage: 'Please Enter ID Number',
                  regEx: AppConst.idPattern,
                  hintText: 'ID',
                  nameofController: idController,
                  isvisble: false,
                  keyBoredType: TextInputType.number,
                  prefixIcon: const Icon(IconlyLight.profile),
                ),
              ),
              const CustomUpload(),
              SizedBox(
                height: 140.h,
              ),
              DefultButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.childernInfoRoute);
                  },
                  text: 'Save'),
              SizedBox(
                height: 90.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
