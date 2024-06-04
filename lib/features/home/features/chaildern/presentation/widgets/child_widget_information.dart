import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/features/home/features/pofile/presentation/screens/childdesc.dart';

class ChildWidgetInformation extends StatelessWidget {
  ChildWidgetInformation({super.key, required this.value});
  File value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 118.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
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
                        builder: (context) =>  ChildDescription()));
              },
              icon: SizedBox(
                height: 50.h,
                width: 50.w,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0xffD9D9D9),
                  child: value == null
                      ? const Center(
                          child: Text(
                            ' Not Found',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat meduim'),
                          ),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(File(value.path)),
                        ),
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Text("1st child's name",
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
    );
  }
}
