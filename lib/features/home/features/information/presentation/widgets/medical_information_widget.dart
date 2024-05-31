import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/item_builder.dart';

class MedicalInformationWidget extends StatelessWidget {
  MedicalInformationWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.boold_type,
      required this.chronic_disease,
      required this.Allergies,
      required this.Type_of_allergy,
      required this.medical_analysis,
      required this.x_ray_image});
  ExpandedTileController controller = ExpandedTileController();
  String height;
  String width;
  String boold_type;
  String chronic_disease;
  String Allergies;
  String Type_of_allergy;
  String x_ray_image;
  String medical_analysis;

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
          getTranslated("Medicalinformation", context)!,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: const Color.fromRGBO(0, 72, 84, 1),
            fontFamily: 'Montserrat semibold',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Container(
            height: 750.h,
            color: AppColors.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemBuilder(
                        title: 'Height',
                        response: height.toString(),
                        width: 100.w),
                    ItemBuilder(
                        title: 'Weight',
                        response: width.toString(),
                        width: 100.w),
                  ],
                ),
                SizedBox(height: 6.h),
                ItemBuilder(
                  title: 'chronic disease',
                  response: chronic_disease,
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'Allegies',
                  response: Allergies,
                  width: double.infinity,
                ),
                ItemBuilder(
                  title: 'Type of allergy',
                  response: Type_of_allergy,
                  width: double.infinity,
                ),
                Text(
                  "X-Ray Image",
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 72, 84, 1),
                    fontFamily: 'Montserrat semibold',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: SizedBox(
                    height: 250.h,
                    width: double.infinity,
                    child: Image.network(x_ray_image, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                ItemBuilder(
                  title: 'Medical Analysis',
                  response: medical_analysis,
                  width: double.infinity,
                ),
              ],
            )),
      ),
    );
  }
}
