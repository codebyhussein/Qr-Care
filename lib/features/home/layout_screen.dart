import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/home/features/information/presentation/screens/info_screen.dart';
import 'package:qr_care/features/home/features/pofile/profile_screen.dart';
import 'package:qr_care/features/home/features/qr_data/presentation/screens/qr_screen.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/screens/scan_screen.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({super.key});
  List<Widget> Screen = [
    const ScanScreen(),
    const QrScreen(),
    const InfoScreen(),
    const ProfileScreen(),
  ];
  int currentindex = 0;
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          widget.Screen[widget.currentindex],
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10 * 3, vertical: 10 / 2),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: const [AppColors.defaultBoxShadow]),
                height: 46.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 42.h,
                      width: 42.w,
                      decoration: BoxDecoration(
                          color: widget.currentindex == 0
                              ? AppColors.mainColor
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      child: IconButton(
                        icon: Icon(
                          IconlyLight.scan,
                          color: widget.currentindex == 0
                              ? Colors.white
                              : AppColors.mainColor,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.currentindex = 0;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 42.h,
                      width: 42.w,
                      decoration: BoxDecoration(
                          color: widget.currentindex == 1
                              ? AppColors.mainColor
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      child: IconButton(
                        icon: widget.currentindex == 1
                            ? SvgPicture.asset('assets/svg/qr_white.svg')
                            : SvgPicture.asset('assets/svg/qr.svg'),
                        onPressed: () {
                          setState(() {
                            widget.currentindex = 1;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 42.h,
                      width: 42.w,
                      decoration: BoxDecoration(
                          color: widget.currentindex == 2
                              ? AppColors.mainColor
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      child: IconButton(
                        icon: widget.currentindex == 2
                            ? SvgPicture.asset(
                                'assets/svg/info_white.svg',
                              )
                            : SvgPicture.asset(
                                'assets/svg/info.svg',
                              ),
                        onPressed: () {
                          setState(() {
                            widget.currentindex = 2;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 42.h,
                      width: 42.w,
                      decoration: BoxDecoration(
                          color: widget.currentindex == 3
                              ? AppColors.mainColor
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      child: IconButton(
                        icon: Icon(
                          IconlyLight.profile,
                          color: widget.currentindex == 3
                              ? Colors.white
                              : AppColors.mainColor,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.currentindex = 3;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
