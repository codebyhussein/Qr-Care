import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar_forget_password.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {"title": 'New Scan - 10:30 AM', "body": 'Scan - 10:30 AM - person XYZ'},
    // {"title": 'New Scan - 11:15 AM', "body": 'Scan - 11:15 AM - person ABC'},
    // {"title": 'New Scan - 1:45 PM', "body": 'Scan - 1:45 PM - person DEF'},
    // {"title": 'New Scan - 3:20 PM', "body": 'Scan - 3:20 PM - person GHI'},
    // {"title": 'New Scan - 5:50 PM', "body": 'Scan - 5:50 PM - person JKL'},
  ];

  NotificationsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomAppBar(title: 'Notifications'),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.vertical,
                  //       itemCount: notifications.length,
                  //       itemBuilder: (BuildContext context, index) {
                  //         return NotificationBuilder(
                  //           title: notifications[index]['title']!,
                  //           dec: notifications[index]['body']!,
                  //         );
                  //       }),
                  // )
                  const Spacer(),

                  Image.asset('assets/images/meassage.png'),
                  // Figma Flutter Generator NonotificationsWidget - TEXT
                  const Text(
                    'No Notifications',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 72, 84, 1),
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        letterSpacing: -0.23999999463558197,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  SizedBox(
                    height: 10.h,
                  ), // Figma Flutter Generator WellletyouknowwhentherewillbesomethingtoupdateyouWidget - TEXT
                  const Text(
                    'We’ll let you know when there will be something to update you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(121, 121, 121, 1),
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        letterSpacing: -0.23999999463558197,
                        fontWeight: FontWeight.normal,
                        height: 1.375),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  const Spacer(),
                ]),
          ),
        ));
  }
}
