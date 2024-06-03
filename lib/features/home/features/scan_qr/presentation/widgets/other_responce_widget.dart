import 'package:flutter/material.dart';
import 'package:qr_care/core/Services/Api/api_services.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/personal_information_widget.dart';

class OtherResponseWidget extends StatelessWidget {
  OtherResponseWidget({super.key, required this.qr_data});

  String qr_data;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService().getPersonlaData(qr_data: qr_data),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            if (data['status'] == 'fail') {
              return Center(
                  child: AppWidgets.defultdesrptionRegister(
                      text: data['message']));
            } else {
              return PersonalInformationWidget(
                jop: data['data']['user']['job'],
                national_id: data['data']['user']['national_id'],
                name: data['data']['user']['emergency_name'],
                phone_number: data['data']['user']['contact'],
                data_of_birth:
                    data['data']['user']['date_of_birth'] ?? "20/9/2002",
              );
            }
          } else {
            return Center(
                child: AppWidgets.defultdesrptionRegister(
                    text: 'Faild this qr code in vaild'));
          }
        });
  }
}
