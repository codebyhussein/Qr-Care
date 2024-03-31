import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationBuilder extends StatelessWidget {
  NotificationBuilder({super.key, required this.title, required this.dec});
  String title;
  String dec;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 88.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/notification.png',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Notice",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color.fromRGBO(0, 72, 84, 1),
                  fontFamily: 'Montserrat Bold',
                  fontSize: 14.sp,
                ),
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              Text(
                dec,
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Montserrat SemiBold',
                    fontSize: 12.sp),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              'Now',
              style:
                  TextStyle(color: Colors.grey, fontFamily: 'Montserrat Bold'),
            ),
          )
        ],
      ),
    );
  }
}
