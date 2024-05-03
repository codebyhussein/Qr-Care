import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/app_color.dart';

import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/defult_botton.dart';

class DialogWidget extends StatelessWidget {
  DialogWidget({super.key, required this.accountId});

  String accountId;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        iconColor: Colors.white,
        content: Container(
          height: 200.h,
          width: 170.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.mainColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 210.w),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        IconlyLight.close_square,
                        color: Colors.white,
                      )),
                ),
                AppWidgets.titleDialog(
                    text: getTranslated("idCreated", context)!),
                Text(accountId,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30.h,
                ),
                DefultButtonLayoutScreen(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'ok',
                  colorButton: Colors.white,
                  colorText: AppColors.primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
