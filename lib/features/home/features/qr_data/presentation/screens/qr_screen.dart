import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/defult_botton.dart';
import 'package:qr_care/features/home/widgets/custom_appbar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  final _renderObjectKey = GlobalKey();

  Uint8List? capturedImage;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getWidgetImage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          CustomAppBarLayoutScreen(
            title: 'QR Code',
          ),
          SizedBox(
            height: 137.h,
          ),
          Center(
            child: Container(
              height: 366.h,
              width: 335.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.mainColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
                  Text(
                    'QR Code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Montserrat Bold',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RepaintBoundary(
                    key: _renderObjectKey,
                    child: QrImageView(
                      data: "j8TkZwHx7pFQa6R3LY1EoI9GnC",
                      version: QrVersions.auto,
                      size: 250.0,
                      backgroundColor: AppColors.mainColor,
                      foregroundColor: const Color(0xffDADADA),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          DefultButtonLayoutScreen(
            onPressed: _shareQrCodeImage,
            text: getTranslated("Share", context)!,
          ),
        ],
      ),
    );
  }

  Future<void> _shareQrCodeImage() async {
    if (capturedImage != null) {
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/qr_code.png');
      await file.writeAsBytes(capturedImage!);
      await Share.shareFiles([file.path]);
    }
  }

  Future<void> _getWidgetImage() async {
    try {
      RenderRepaintBoundary boundary = _renderObjectKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData?.buffer.asUint8List();
      setState(() {
        capturedImage = pngBytes;
      });
    } catch (exception) {
      print(exception);
      // Handle the error as needed
    }
  }
}
