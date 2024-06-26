import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/home/features/chaildern/Model/ChildInfoModel.dart';
import 'package:qr_care/features/home/features/pofile/presentation/widgets/CustomCard.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/defult_botton.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;
import '../../../../../forgetPassword/presentation/widgets/custom_appbar.dart';

class ChildDescription extends StatefulWidget {
  ChildDescription({super.key, @required this.childInfoModel});
  ChildInfoModel? childInfoModel;
  @override
  State<ChildDescription> createState() => _ChildDescriptionState();
}

class _ChildDescriptionState extends State<ChildDescription> {
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
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          CustomAppBar(
            title: getTranslated("FirstChild", context)!,
          ),
          SizedBox(
            height: 35.h,
          ),
          CustomCard(
            textId: widget.childInfoModel?.nationalId != null
                ? widget.childInfoModel!.nationalId.toString()
                : "1589281071982",
            ageValue: widget.childInfoModel?.age != null
                ? widget.childInfoModel!.age.toString()
                : "6",
            text: "Age :",
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
              width: 307,
              height: 300,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [AppColors.defaultBoxShadow]),
              child: RepaintBoundary(
                key: _renderObjectKey,
                child: QrImageView(
                  data: widget.childInfoModel!.nationalId.toString(),
                  version: QrVersions.auto,
                  size: 50.0,
                  backgroundColor: AppColors.mainColor,
                  foregroundColor: const Color(0xffDADADA),
                ),
              )),
          SizedBox(
            height: 54.h,
          ),
          DefultButtonLayoutScreen(
              onPressed: _shareQrCodeImage,
              text: getTranslated("Share", context)!)
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
      //print(exception);
      // Handle the error as needed
    }
  }
}
