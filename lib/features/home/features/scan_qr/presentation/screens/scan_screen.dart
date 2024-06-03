import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/home/features/scan_qr/cubit/scan_qr_cubit.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/defult_botton.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/doctor_response_widget.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/officer_response_widget.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/other_responce_widget.dart';
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
                      DoctorResponseWidget(
                        qr_data: qrResult,
                      ),
                    if (accountId.contains('officer'))
                      OfficerResponseWidget(
                        qr_data: qrResult,
                      ),
                    if (accountId.contains('other'))
                      OtherResponseWidget(
                        qr_data: qrResult,
                      ),
                  ],
                )
        ]),
      ),
    );
  }
}
