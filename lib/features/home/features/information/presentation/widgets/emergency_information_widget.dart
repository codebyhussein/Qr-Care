import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/item_builder.dart';

class EmergencyInformationWidget extends StatelessWidget {
  EmergencyInformationWidget({super.key});
  ExpandedTileController controller = ExpandedTileController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ExpandedTile(
        theme: ExpandedTileThemeData(
          headerColor: Colors.white,
          headerRadius: 15.0,
          headerSplashColor: Colors.grey,
          contentBackgroundColor: AppColors.backgroundColor,
          contentPadding: const EdgeInsets.all(12.0),
          contentRadius: 12.0,
        ),
        controller: controller,
        title: Text(
          'Emergency Information',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: const Color.fromRGBO(0, 72, 84, 1),
            fontFamily: 'Montserrat semibold',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Container(
            height: 600.h,
            color: AppColors.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemBuilder(
                  title: 'Name',
                  response: 'Not Known ',
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'Emergency Contact',
                  response: 'Not Known ',
                  width: double.infinity,
                ),
              ],
            )),
      ),
    );
  }
}
