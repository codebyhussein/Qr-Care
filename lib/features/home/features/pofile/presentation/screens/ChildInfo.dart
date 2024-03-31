import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';

import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar_forget_password.dart';
import 'package:qr_care/features/home/features/pofile/presentation/screens/childdesc.dart';
import 'package:qr_care/features/home/layout_screen.dart';
import 'package:qr_care/features/widgets/add_chid_widget.dart';

import 'package:qr_care/features/widgets/defult_button.dart';

class ChildrenInfo extends StatelessWidget {
  const ChildrenInfo({super.key});

  get formKey => null;

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
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                CustomAppBar(title: 'Childern Information'),
                SizedBox(height: 152.h),

                Container(
                  height: 100.h,
                  width: 118.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14)),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 15.h),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChildDescription()));
                          },
                          icon: SizedBox(
                            height: 50.h,
                            width: 50.w,
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundColor: Color(0xffD9D9D9),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage("assets/images/child_one.webp"),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: 6.h),
                        Text("Mohamed",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: const Color.fromRGBO(0, 72, 84, 1),
                                fontFamily: 'Montserrat semibold',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                height: 1)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 75.h),
                const AddChildWidget(),
                SizedBox(
                  height: 195.h,
                ),
                DefultButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LayoutScreen();
                        },
                      );
                    },
                    text: 'Submit'),

                // ),
              ],
            ),
          ),
        ));
  }
}
