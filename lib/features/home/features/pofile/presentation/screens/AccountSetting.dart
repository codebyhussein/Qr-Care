import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/Localization/cubit/change_lang_cubit.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/assets/assets_manager.dart';
import 'package:qr_care/features/home/features/pofile/presentation/widgets/CustomButton.dart';
import 'package:qr_care/features/home/widgets/CustomText.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), side: BorderSide.none),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(style: BorderStyle.none)),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(IconlyLight.close_square))),
            CustomText(
              text: getTranslated("AccountSetting", context)!,
              alignment: AlignmentDirectional.center,
              color: Colors.white,
              fontSize: 15.sp,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              text: getTranslated("ChangePassword", context)!,
              icon: IconlyLight.lock,
              onPressed: () {
                Navigator.pushNamed(context, Routes.changePasswordRoute);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              text: getTranslated("Language", context)!,
              icon: Icons.language_rounded,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return changeLangAlert(context);
                  },
                );
              },
            ),
            SizedBox(
              height: 65.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget changeLangAlert(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.mainColor,
      title: Text(
        getTranslated("ChangeLanguage", context)!,
        style: TextStyle(color: AppColors.backgroundColor),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              BlocProvider.of<ChangeLangCubit>(context)
                  .appLanguage(EventToChangeLang.arabicLang);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "العربيه",
                  style: TextStyle(color: AppColors.backgroundColor),
                ),
                Image.asset(
                  AppAssets.palestine,
                  width: 50,
                  height: 50,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              BlocProvider.of<ChangeLangCubit>(context)
                  .appLanguage(EventToChangeLang.englishLang);
              Navigator.pop(context);


            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "English",
                  style: TextStyle(color: AppColors.backgroundColor),
                ),
                Image.asset(
                  AppAssets.en,
                  width: 50,
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
