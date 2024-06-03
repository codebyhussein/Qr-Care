import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/assets/assets_manager.dart';
import 'package:qr_care/features/home/features/information/cubit/information_cubit.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/conscription_information.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/medical_information_widget.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/personal_information_widget.dart';
import 'package:qr_care/features/home/widgets/custom_appbar.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
                title: getTranslated("Information", context)!,
              ),
              SizedBox(
                height: 42.h,
              ),
              Center(child: SvgPicture.asset(AppAssets.logoBath)),
              SizedBox(
                height: 27.h,
              ),

              FutureBuilder(
                  future: BlocProvider.of<InformationCubit>(context)
                      .getPersonalData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return Column(
                        children: [
                          PersonalInformationWidget(
                            jop: data['data']['user']['job'],
                            national_id: data['data']['user']['national_id'],
                            name: data['data']['user']['emergency_name'],
                            phone_number: data['data']['user']['contact'],
                            data_of_birth: data['data']['user']
                                    ['date_of_birth'] ??
                                '20/2/2002',
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          ConscritionInformationWidget(
                            service_start_date: data['data']
                                        ['user_conscription_status'][0]
                                    ['service_start_date'] ??
                                "--------------------",
                            service_end_date: data['data']
                                        ['user_conscription_status'][0]
                                    ['service_end_date'] ??
                                "--------------------",
                            notes: data['data']['user_conscription_status'][0]
                                    ['notes'] ??
                                "--------------------",
                            national_id: data['data']
                                        ['user_conscription_status'][0]
                                    ['national_id'] ??
                                "--------------------",
                            exemption_reason: data['data']
                                        ['user_conscription_status'][0]
                                    ['exemption_reason'] ??
                                "--------------------",
                            conscription_status: data['data']
                                        ['user_conscription_status'][0]
                                    ['conscription_status'] ??
                                "--------------------",
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const Text('');
                  }),
              SizedBox(
                height: 15.h,
              ),
              FutureBuilder(
                  future: BlocProvider.of<InformationCubit>(context)
                      .getMedicalData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!['data'];
                      return MedicalInformationWidget(
                        height: data['medical_tests'][0]['height'] ??
                            "-----------------",
                        boold_type: data['medical_tests'][0]['blood_type'] ??
                            "-----------------",
                        chronic_disease: data['medical_tests'][0]
                                ['chronic_disease'] ??
                            "-----------------",
                        width: data['medical_tests'][0]['weight'] ??
                            "-----------------",
                        medical_analysis: data['medical_analysis'][0]
                                ['analysis_text'] ??
                            "-----------------",
                        Allergies: data['user_allergies'][0]['allergen_name'] ??
                            "-----------------",
                        Type_of_allergy: data['user_allergies'][0]
                                ['reaction'] ??
                            "-----------------",
                        // x_ray_image: data['medical_tests'][0]
                        //         ['x_ray_image'] ??
                        //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpG0xwjiIHyvGSCIJDOCZ_VEzEntS0LHnhCQ&s",
                        x_ray_image:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpG0xwjiIHyvGSCIJDOCZ_VEzEntS0LHnhCQ&s",
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const Text('');
                  }),

              // EmergencyInformationWidget(),
            ],
          ),
        ));
  }
}
