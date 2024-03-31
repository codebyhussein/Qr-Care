import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';

class CustomCard extends StatefulWidget {
  CustomCard(
      {super.key,
      required this.textId,
      required this.ageValue,
      required this.text});

  String textId;
  String ageValue;
  String text;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  File? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 179.h,
      width: 307.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [AppColors.defaultBoxShadow],
          color: Colors.white),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                AppWidgets.defultText(text: 'Mohamed Mohamed'),
                SizedBox(
                  height: 25.h,
                ),
                AppWidgets.title(
                    text: 'ID:',
                    fontSize: 14.sp,
                    textAlign: TextAlign.left,
                    sizeBox: 25.h),
                SizedBox(
                    width: 120.w,
                    child: AppWidgets.description(
                      colorText: Colors.grey,
                      textAlign: TextAlign.left,
                      text: widget.textId,
                      fontSize: 12.sp,
                    )),
                AppWidgets.title(
                    text: 'Age:',
                    fontSize: 14.sp,
                    textAlign: TextAlign.left,
                    sizeBox: 25.h),
                SizedBox(
                    width: 120.w,
                    child: AppWidgets.description(
                      colorText: Colors.grey,
                      textAlign: TextAlign.left,
                      text: widget.ageValue,
                      fontSize: 12.sp,
                    )),
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              final pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                setState(() {
                  value = File(pickedFile.path);
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: const Color(0xffD9D9D9),
                child: value == null
                    ? CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[400],
                        // backgroundImage:
                        //     AssetImage("assets/images/child_one.webp"),
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(File(value!.path)),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
