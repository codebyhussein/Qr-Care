import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
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
              CustomAppBar(title: getTranslated("FirstChildData", context)!),
              SizedBox(
                height: 117.h,
              ),
              AppWidgets.defultText(text: getTranslated("ChooseImage", context)!),
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
                      ?  Center(
                          child: Text(
                           getTranslated("Upload", context)! ,
                            style:const TextStyle(
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
                  getTranslated("IDNumber", context)!,
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
                  helpText: getTranslated("helpMessageId", context),
                  errorMassage: getTranslated("errorMessageId", context)!,
                  regEx: AppConst.idPattern,
                  hintText:getTranslated("iD", context)!,
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
                  text: getTranslated("save", context)!),
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
