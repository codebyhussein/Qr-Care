import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/Services/Api/api_services.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/item_builder.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/medical_information_widget.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/personal_information_widget.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/defult_botton.dart';
import 'package:qr_care/features/home/widgets/custom_appbar.dart';
import 'package:qr_care/features/widgets/qr_code_widget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late QRViewController controller;
  String qrResult = '';
  bool isScanning = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30.h,
          ),
          CustomAppBarLayoutScreen(
            title: 'Scan QR',
          ),
          qrResult.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 137.h,
                      ),
                      Container(
                        height: 366.h,
                        width: 337.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.mainColor),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 13.h,
                                  ),
                                  Text(
                                    'SCAN QR',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 0),
                                      fontFamily: 'Montserrat Bold',
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                      height: 250.h,
                                      width: 250.w,
                                      child: ScanQRWidget(onQRViewCreated:
                                          (QRViewController controller) async {
                                        //  isDoctor = prefs.getBool('isDoctor')!;
                                        this.controller = controller;
                                        controller.scannedDataStream
                                            .listen((scanData) {
                                          setState(() {
                                            qrResult = scanData.code!;
                                          });
                                        });
                                      })),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      DefultButtonLayoutScreen(
                        onPressed: () {
                          setState(() {
                            isScanning = true;
                          });
                        },
                        text: getTranslated("ScanQr", context)!,
                      )
                    ],
                  ),
                )
              : FutureBuilder<List<dynamic>>(
                  future: ApiService().getData(qr_data: qrResult),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      String accountId = CacheHelper.getData(key: 'account_id');
                      final data = snapshot.data!;
                      return Column(
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          if (!accountId.contains('doctor'))
                            Container(
                                height: 700.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.backgroundColor),
                                child: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    ItemBuilder(
                                      title: 'Name',
                                      response: 'hussein',
                                      width: double.infinity,
                                    ),
                                    ItemBuilder(
                                      title: 'Emrgancy Number',
                                      response: '01277532063',
                                      width: double.infinity,
                                    ),
                                  ],
                                ))),
                          if (accountId.contains('doctor'))
                            Container(
                                height: 700.h,
                                width: double.infinity,
                                color: AppColors.backgroundColor,
                                child: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    PersonalInformationWidget(
                                      data_of_birth: '20/9/2002',
                                      jop: AppConst.data[0]['jop'],
                                      national_id: AppConst.data[0]
                                          ['national_id'],
                                      name: AppConst.data[0]['name'],
                                      phone_number: AppConst.data[0]
                                          ['phone_number'],
                                    ),
                                    MedicalInformationWidget(
                                      height: data[0]['height'],
                                      boold_type: AppConst.data[0]
                                          ['blood_type'],
                                      chronic_disease: AppConst.data[0]
                                          ['chronic_disease'],
                                      width: data[0]['weight'],
                                      medical_analysis: data[0]
                                          ['medical_analysis'],
                                      Allergies: data[0]['allergies'],
                                      x_ray_image: data[0]['x_ray_image'] ??
                                          "assets/images/not-found.jpg",
                                      Type_of_allergy: data[0]
                                          ['type_of_allergy'],
                                    ),
                                  ],
                                ))),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
        ]),
      ),
    );
  }
}
