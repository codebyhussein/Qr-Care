import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({
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
                  const Spacer(),
                  Image.asset('assets/images/meassage.png'),
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
                  ),
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
