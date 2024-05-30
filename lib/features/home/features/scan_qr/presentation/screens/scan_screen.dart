import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/Services/Api/api_services.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/medical_information_widget.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/personal_information_widget.dart';
import 'package:qr_care/features/home/features/scan_qr/cubit/scan_qr_cubit.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/defult_botton.dart';
import 'package:qr_care/features/home/widgets/custom_appbar.dart';
import 'package:qr_care/features/widgets/qr_code_widget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
    var cubit = ScanQrCubit.get(context);
    String accountId = CacheHelper.getData(key: 'account_id');
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
              : Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    if (accountId.contains('doctor'))
                      Column(
                        children: [
                          FutureBuilder(
                              future: ApiService()
                                  .getMedicalData(qr_data: qrResult),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final data = snapshot.data![
                                      'data']; // Get the 'data' object from the response
                                  return MedicalInformationWidget(
                                    height: data['medical_tests'][0]['height'],
                                    boold_type: data['medical_tests'][0]
                                        ['blood_type'],
                                    chronic_disease: data['medical_tests'][0]
                                        ['chronic_disease'],
                                    width: data['medical_tests'][0]['weight'],
                                    medical_analysis: data['medical_analysis']
                                        [0]['analysis_text'],
                                    Allergies: data['user_allergies'][0]
                                        ['allergen_name'],
                                    Type_of_allergy: data['user_allergies'][0]
                                        ['reaction'],
                                    // x_ray_image: data['medical_tests'][0]
                                    //         ['x_ray_image'] ??
                                    //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpG0xwjiIHyvGSCIJDOCZ_VEzEntS0LHnhCQ&s",
                                    x_ray_image:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpG0xwjiIHyvGSCIJDOCZ_VEzEntS0LHnhCQ&s",
                                  );
                                } else {
                                  // return Text('error${snapshot.error}');
                                  return const Center(
                                      child: Text(
                                          'No  data found for this national ID',
                                          style:
                                              TextStyle(color: Colors.black)));
                                }
                              }),
                          SizedBox(
                            height: 20.h,
                          ),
                          FutureBuilder(
                              future: ApiService()
                                  .getPersonlaData(qr_data: qrResult),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final data = snapshot.data!;
                                  return PersonalInformationWidget(
                                    jop: data['data']['user']['job'],
                                    national_id: data['data']['user']
                                        ['national_id'],
                                    name: data['data']['user']
                                        ['emergency_name'],
                                    phone_number: data['data']['user']
                                        ['contact'],
                                    data_of_birth: data['data']['user']
                                            ['date_of_birth'] ??
                                        '20/2/2002',
                                  );
                                } else {
                                  return const Center(
                                      child: Text(
                                          'No  data found for this national ID',
                                          style:
                                              TextStyle(color: Colors.black)));
                                }
                              }),
                        ],
                      ),
                    if (!accountId.contains('doctor'))
                      FutureBuilder(
                          future:
                              ApiService().getPersonlaData(qr_data: qrResult),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final data = snapshot.data!;
                              return PersonalInformationWidget(
                                jop: data['data']['user']['job'],
                                national_id: data['data']['user']
                                    ['national_id'],
                                name: data['data']['user']['emergency_name'],
                                phone_number: data['data']['user']['contact'],
                                data_of_birth: data['data']['user']
                                    ['date_of_birth'],
                              );
                            } else {
                              return Text('error${snapshot.error}');
                            }
                          }),
                  ],
                )
        ]),
      ),
    );
  }
}
