import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/assets/assets_manager.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/medical_information_widget.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/personal_information_widget.dart';
import 'package:qr_care/features/home/widgets/custom_appbar.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

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
              CustomAppBarLayoutScreen(
                title: 'Information',
              ),
              SizedBox(
                height: 42.h,
              ),
              Center(child: SvgPicture.asset(AppAssets.logo_Path)),
              SizedBox(
                height: 27.h,
              ),
              PersonalInformationWidget(
                data_of_birth: AppConst.data[0]['data_of_birth'],
                jop: AppConst.data[0]['jop'],
                national_id: AppConst.data[0]['national_id'],
                name: AppConst.data[0]['name'],
                phone_number: AppConst.data[0]['phone_number'],
              ),
              MedicalInformationWidget(
                height: AppConst.data[0]['height'],
                boold_type: AppConst.data[0]['blood_type'],
                chronic_disease: AppConst.data[0]['chronic_disease'],
                width: AppConst.data[0]['weight'],
                medical_analysis: AppConst.data[0]['medical_analysis'],
                Allergies: AppConst.data[0]['Allergies'],
                x_ray_image: AppConst.data[0]['x_ray_image'],
                Type_of_allergy: AppConst.data[0]['Type_of_allergy'],
              ),
              // EmergencyInformationWidget(),
            ],
          ),
        ));
  }
}
