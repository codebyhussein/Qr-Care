import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/Services/Api/api_services.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/medical_information_widget.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/personal_information_widget.dart';

import '../../../../../../core/app_widgets.dart';

class DoctorResponseWidget extends StatelessWidget {
  DoctorResponseWidget({super.key, required this.qr_data});
  String qr_data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: ApiService().getPersonlaData(qr_data: qr_data),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                if (data["status"] == "fail") {
                  return Center(
                      child: AppWidgets.defultdesrptionRegister(
                          text: data['message']));
                } else {
                  return PersonalInformationWidget(
                    jop: data['data']['user']['job'] ?? "----------",
                    national_id:
                        data['data']['user']['national_id'] ?? "----------",
                    name:
                        data['data']['user']['emergency_name'] ?? "----------",
                    phone_number:
                        data['data']['user']['contact'] ?? "----------",
                    data_of_birth:
                        data['data']['user']['date_of_birth'] ?? '20/2/2002',
                  );
                }
              } else {
                return const Center(
                    child: Text('Faild this qr code in vaild',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)));
              }
            }),
        SizedBox(
          height: 15.h,
        ),
        FutureBuilder(
          future: ApiService().getPersonlaData(qr_data: qr_data),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              if (data["status"] == "fail") {
                return Center(
                    child: AppWidgets.defultdesrptionRegister(
                        text: data['message']));
              } else {
                return MedicalInformationWidget(
                  height: data['data']['medical_tests']?.isNotEmpty == true
                      ? data['data']['medical_tests'][0]['height'] ?? "----"
                      : "No data found",
                  boold_type: data['data']['medical_tests']?.isNotEmpty == true
                      ? data['data']['medical_tests'][0]['blood_type'] ??
                          "----------"
                      : "No data found",
                  chronic_disease: data['data']['medical_tests']?.isNotEmpty ==
                          true
                      ? data['data']['medical_tests'][0]['chronic_disease'] ??
                          "----------"
                      : "No data found",
                  width: data['data']['medical_tests']?.isNotEmpty == true
                      ? data['data']['medical_tests'][0]['weight'] ?? "----"
                      : "No data found",
                  medical_analysis:
                      data['data']['medical_analysis']?.isNotEmpty == true
                          ? data['data']['medical_analysis'][0]
                                  ['analysis_text'] ??
                              "----------"
                          : "No data found",
                  Allergies: data['data']['user_allergies']?.isNotEmpty == true
                      ? data['data']['user_allergies'][0]['allergen_name'] ??
                          "----------"
                      : "No data found",
                  Type_of_allergy:
                      data['data']['user_allergies']?.isNotEmpty == true
                          ? data['data']['user_allergies'][0]['reaction'] ??
                              "----------"
                          : "No data found",
                  x_ray_image:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpG0xwjiIHyvGSCIJDOCZ_VEzEntS0LHnhCQ&s",
                );
              }
            } else {
              return const Center(
                  child: Text('No data found for this national ID',
                      style: TextStyle(color: Colors.black)));
            }
          },
        ),
      ],
    );
  }
}
