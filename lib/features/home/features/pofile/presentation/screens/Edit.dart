import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar_forget_password.dart';
import 'package:qr_care/features/home/features/pofile/presentation/widgets/textWidget.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/defult_botton.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/dropdwan_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController governmentController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController centerController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            CustomAppBar(
              title: 'My Account',
            ),
            SizedBox(
              height: 10.h,
            ),
            titleWidget(text: "Governorate"),
            SizedBox(
              height: 6.h,
            ),
            DefaultDropdown(
                hintText: 'Select Government',
                errorMassage: 'Please Choose a job',
                controllerName: governmentController,
                listName: AppConst.cities,
                onChanged: (value) {
                  governmentController.text = value!;
                }),
            SizedBox(
              height: 10.h,
            ),
            titleWidget(text: "City"),
            SizedBox(
              height: 6.h,
            ),
            DefaultDropdown(
                hintText: 'Select City',
                errorMassage: 'Please Choose City',
                controllerName: centerController,
                listName: AppConst.cities,
                onChanged: (value) {
                  cityController.text = value!;
                }),
            SizedBox(
              height: 10.h,
            ),
            titleWidget(text: "Center"),
            SizedBox(
              height: 6.h,
            ),
            DefaultDropdown(
                hintText: 'Select Center',
                errorMassage: 'Please Choose a Center',
                controllerName: centerController,
                listName: AppConst.cities,
                onChanged: (value) {
                  centerController.text = value!;
                }),
            SizedBox(
              height: 10.h,
            ),
            titleWidget(text: "Job"),
            SizedBox(
              height: 6.h,
            ),
            DefaultDropdown(
                hintText: 'Choose a job',
                errorMassage: 'Please Choose a job',
                controllerName: jobController,
                listName: AppConst.jops,
                onChanged: (value) {
                  jobController.text = value!;
                }),
            SizedBox(
              height: 10.h,
            ),
            titleWidget(text: "Contact"),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomTextFormField(
                  regEx: AppConst.phonePattern,
                  prefixIcon: const Icon(IconlyLight.call),
                  hintText: 'Phone',
                  errorMassage: 'Please Enter Your  Phone Number',
                  nameofController: phoneController,
                  keyBoredType: TextInputType.number,
                  isvisble: false),
            ),
            SizedBox(
              height: 10.h,
            ),
            titleWidget(text: "Emergency Contact"),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomTextFormField(
                regEx: AppConst.phonePattern,
                prefixIcon: const Icon(IconlyLight.call),
                hintText: 'Phone-Home',
                errorMassage:
                    'Please Enter Mobile  number of Emergency Contact',
                nameofController: MobileController,
                keyBoredType: TextInputType.number,
                isvisble: false,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            DefultButtonLayoutScreen(
              text: "Save",
              onPressed: () {
                Navigator.pushNamed(context, Routes.homeScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
