import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/item_builder.dart';

class ConscritionInformationWidget extends StatelessWidget {
  ConscritionInformationWidget(
      {super.key,
      required this.conscription_status,
      required this.exemption_reason,
      required this.service_start_date,
      required this.notes,
      required this.national_id,
      required this.service_end_date});
  ExpandedTileController controller = ExpandedTileController();
  String notes;
  String service_end_date;
  String service_start_date;
  String exemption_reason;
  String national_id;
  String conscription_status;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
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
          'Conscrition Information',
          //getTranslated("PersonalInformation", context)!,
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
                  title: 'National Id',
                  response: national_id,
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'Conscription Status',
                  response: conscription_status,
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'Exemption Reason',
                  response: exemption_reason,
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'Service Start Date',
                  response: service_start_date,
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'Service End Date',
                  response: service_end_date,
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'Notes',
                  response: notes,
                  width: double.infinity,
                ),
              ],
            )),
      ),
    );
  }
}
