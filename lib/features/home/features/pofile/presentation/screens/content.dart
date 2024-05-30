import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/animation.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/features/home/features/pofile/cubit/pofile_cubit.dart';
import 'package:qr_care/features/home/features/pofile/presentation/screens/AboutApp.dart';
import 'package:qr_care/features/home/features/pofile/presentation/screens/AccountSetting.dart';

import 'package:qr_care/features/home/features/pofile/presentation/screens/HelpAndSupport.dart';
import 'package:qr_care/features/home/features/pofile/presentation/screens/LogOut.dart';
import 'package:qr_care/features/home/features/pofile/presentation/widgets/CustomButton.dart';
import 'package:qr_care/features/home/features/pofile/presentation/widgets/CustomCard.dart';

class ContentProfile extends StatelessWidget {
  const ContentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: BlocProvider.of<ProfileCubit>(context).getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!["data"]['user'];
                return CustomCard(
                  ageValue: AppConst.calculateAge(
                          data['date_of_birth'] ?? "20-09-2002")
                      .toString(),
                  textId: data['national_id'],
                  text: data['emergency_name'],
                );
              }
              return Container(
                height: 179.h,
                width: 307.w,
                color: AppColors.backgroundColor,
              );
            }),
        SizedBox(
          height: 35.h,
        ),
        CustomButton(
          icon: IconlyLight.profile,
          text: getTranslated("MyAccount", context)!,
          onPressed: () {
            Navigator.pushNamed(context, Routes.myAccountRoute);
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomButton(
          icon: IconlyLight.setting,
          text: getTranslated("AccountSetting", context)!,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const CustomDialog();
              },
            );
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomButton(
            icon: Icons.people_alt_outlined,
            text: getTranslated("ChildrenInformation", context)!,
            onPressed: () {
              Navigator.pushNamed(context, Routes.childernInfoRoute);
            }),
        SizedBox(
          height: 10.h,
        ),
        CustomButton(
          icon: Icons.help_outline,
          text: getTranslated("helpSupport", context)!,
          onPressed: () {
            Navigator.of(context).push(createRoute(const HelpAndSupport()));
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomButton(
          icon: IconlyLight.heart,
          text: getTranslated("AboutApp", context)!,
          onPressed: () {
            Navigator.of(context).push(createRoute(const AboutApp()));
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomButton(
          icon: IconlyLight.logout,
          text: getTranslated("Logout", context)!,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const LogOut();
              },
            );
          },
        ),
      ],
    );
  }
}
