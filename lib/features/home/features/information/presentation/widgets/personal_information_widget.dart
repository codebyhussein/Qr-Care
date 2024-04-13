import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/item_builder.dart';

class PersonalInformationWidget extends StatelessWidget {
  PersonalInformationWidget(
      {super.key,
      required this.data_of_birth,
      required this.jop,
      required this.name,
      required this.national_id,
      required this.phone_number});
  ExpandedTileController controller = ExpandedTileController();
  String name;
  String data_of_birth;
  String jop;
  String phone_number;
  String national_id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(horizontal: 15),
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
          getTranslated("PersonalInformation", context)!,
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
                  response: name,
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'Date of birth',
                  response: data_of_birth,
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'Job',
                  response: jop,
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'Phone Number',
                  response: phone_number,
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'National ID',
                  response: national_id,
                  width: double.infinity,
                ),
              ],
            )),
      ),
    );
  }
}
