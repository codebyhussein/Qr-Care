import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar_forget_password.dart';
import 'package:qr_care/features/widgets/add_chid_widget.dart';

class EmptyChaildernInformationScreen extends StatelessWidget {
  const EmptyChaildernInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/backgroundimage.png'))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  height: 61.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.mainColor,
                        )),
                    CustomAppBar(title: 'Children information'),
                    SizedBox(
                      width: 10.w,
                    )
                  ],
                ),
                SizedBox(height: 152.h),
                const AddChildWidget(),
              ],
            ),
          ),
        ));
  }
}
