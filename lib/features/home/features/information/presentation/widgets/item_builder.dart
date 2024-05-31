import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';

class ItemBuilder extends StatelessWidget {
  ItemBuilder(
      {super.key,
      required this.title,
      required this.response,
      required this.width});

  String title;
  String response;
  double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: const Color.fromRGBO(0, 72, 84, 1),
            fontFamily: 'Montserrat semibold',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Container(
        //   height: 40.h,
        //   width: width,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       border: Border.all(color: AppColors.mainColor),
        //       color: const Color.fromARGB(255, 232, 232, 232)),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       response,
        //       style: const TextStyle(color: Colors.black),
        //     ),
        //   ),
        // )
        LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: double.infinity),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.mainColor),
                  color: const Color.fromARGB(255, 232, 232, 232),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    response,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
