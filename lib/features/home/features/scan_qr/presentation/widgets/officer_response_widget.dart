import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/Services/Api/api_services.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/conscription_information.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/medical_information_widget.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/personal_information_widget.dart';

import '../../../../../../core/app_widgets.dart';

class OfficerResponseWidget extends StatelessWidget {
  OfficerResponseWidget({super.key, required this.qr_data});
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
                  return Column(
                    children: [
                      PersonalInformationWidget(
                        jop: data['data']['user']['job'],
                        national_id: data['data']['user']['national_id'],
                        name: data['data']['user']['emergency_name'],
                        phone_number: data['data']['user']['contact'],
                        data_of_birth: data['data']['user']['date_of_birth'] ??
                            '20/2/2002',
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ConscritionInformationWidget(
                        service_start_date: data['data']
                                    ['user_conscription_status']
                                ['service_start_date'] ??
                            "--------------------",
                        service_end_date: data['data']
                                    ['user_conscription_status']
                                ['service_end_date'] ??
                            "--------------------",
                        notes: data['data']['user_conscription_status']
                                ['notes'] ??
                            "--------------------",
                        national_id: data['data']['user_conscription_status']
                                ['national_id'] ??
                            "--------------------",
                        exemption_reason: data['data']
                                    ['user_conscription_status']
                                ['exemption_reason'] ??
                            "--------------------",
                        conscription_status: data['data']
                                    ['user_conscription_status']
                                ['conscription_status'] ??
                            "--------------------",
                      )
                    ],
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
          height: 20.h,
        ),
      ],
    );
  }
}
