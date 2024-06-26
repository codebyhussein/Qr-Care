import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/core/assets/assets_manager.dart';
import 'package:qr_care/features/register/presentation/widgets/custom_appbar_register_screen.dart';
import 'package:qr_care/features/register/presentation/widgets/dialog_widget.dart';
import 'package:qr_care/features/register/presentation/widgets/parent_builder.dart';

class Screen6 extends StatefulWidget {
  Screen6({super.key});
  bool isparent = true;
  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  @override
  void initState() {
    CacheHelper.getData(key: 'account_id');
    log("the new account id is ${CacheHelper.getData(key: 'account_id')}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const CustomAppBarRegister(),
              SizedBox(
                height: 60.h,
              ),
              AppWidgets.defultTextRegister(
                text: getTranslated("TypeOfAccount", context)!,
              ),
              SizedBox(
                height: 10.h,
              ),
              AppWidgets.defultdesrptionRegister(
                  text: getTranslated("Choosetypeofyouraccount", context)!),
              SizedBox(
                height: 30.h,
              ),
              ParentBuilder(
                isparent: widget.isparent,
                title: getTranslated("parent", context)!,
                description: getTranslated("descParent", context)!,
                image: AppAssets.parentImage,
                onPressed: () {
                  setState(() {
                    widget.isparent = !widget.isparent;
                  });
                  Navigator.pushNamed(context, Routes.addChildRoute);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              ParentBuilder(
                  onPressed: () async {
                    setState(() {
                      widget.isparent = !widget.isparent;
                    });
                    Navigator.pushNamed(context, Routes.homeScreenRoute);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogWidget(
                          accountId: CacheHelper.getData(key: "account_id"),
                        );
                      },
                    );
                  },
                  isparent: !widget.isparent,
                  title: getTranslated("nonParent", context)!,
                  description: getTranslated("descNonParent", context)!,
                  image: AppAssets.nonParentImage),
            ],
          ),
        ),
      ),
    );
  }
}
