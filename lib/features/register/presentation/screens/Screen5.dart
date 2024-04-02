import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/core/assets/assets_manager.dart';
import 'package:qr_care/features/home/features/chaildern/presentation/screens/empty_childern_information_screen.dart';
import 'package:qr_care/features/register/presentation/widgets/custom_appbar_register_screen.dart';
import 'package:qr_care/features/register/presentation/widgets/dialog_widget.dart';
import 'package:qr_care/features/register/presentation/widgets/parent_builder.dart';

class Screen5 extends StatefulWidget {
  Screen5({super.key});
  bool isparent = true;
  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  bool isDoctor = false;
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
                text: 'Type of account',
              ),
              SizedBox(
                height: 10.h,
              ),
              AppWidgets.defultdesrptionRegister(
                  text: 'Choose type of your account'),
              SizedBox(
                height: 30.h,
              ),
              ParentBuilder(
                isparent: widget.isparent,
                title: 'Parent',
                description:
                    'A parent can easily access\nmedical records and\ninformation about himself and\ntheir sons and daughters by\nscanning a QR with the help of\nHospitals or the Ministry of\nHealth.',
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
                    // final SharedPreferences prefs =
                    //     await SharedPreferences.getInstance();
                    // isDoctor = prefs.getBool('isDoctor')!;
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DialogWidget(
                          text: isDoctor ? 'doc1234.com' : 'hussein1234.com',
                        );
                      },
                    );
                  },
                  isparent: !widget.isparent,
                  title: 'Non-Parent',
                  description:
                      'A Non-Parent can easily access\nmedical records and\ninformation about himself and\ntheir sons and daughters by\nscanning a QR with the help of\nHospitals or the Ministry of\nHealth.',
                  image: AppAssets.nonParentImage),
            ],
          ),
        ),
      ),
    );
  }
}
