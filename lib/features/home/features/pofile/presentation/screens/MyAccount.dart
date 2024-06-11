import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar.dart';
import 'package:qr_care/features/home/features/pofile/cubit/EditAccount/edit_account_cubit.dart';
import 'package:qr_care/features/home/features/pofile/presentation/widgets/CustomButton.dart';
import 'package:qr_care/features/home/features/pofile/presentation/widgets/textWidget.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/defult_botton.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<EditAccountCubit, EditAccountState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubitEditData = EditAccountCubit.get(context);
          return SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                CustomAppBar(
                  title: getTranslated("EditMyAccount", context)!,
                ),
                SizedBox(
                  height: 15.h,
                ),
                titleWidget(text: getTranslated("governorate", context)!),
                SizedBox(
                  height: 6.h,
                ),
                CustomButton(
                    icon: IconlyLight.location,
                    // text: "Dakahlia Governorate",
                    text:
                        cubitEditData.accountDataModel?.data?.government != null
                            ? cubitEditData.accountDataModel!.data!.government
                                .toString()
                            : "Dakahlia Governorate",
                    fontSize: 10.sp,
                    color: Colors.grey),
                SizedBox(
                  height: 10.h,
                ),
                titleWidget(text: getTranslated("city", context)!),
                SizedBox(
                  height: 6.h,
                ),
                CustomButton(
                    icon: IconlyLight.location,
                    text:  cubitEditData.accountDataModel?.data?.city != null
                        ? cubitEditData.accountDataModel!.data!.city
                        .toString()
                        : "Mansoura City",
                    fontSize: 10.sp,
                    color: Colors.grey),
                SizedBox(
                  height: 10.h,
                ),
                titleWidget(text: getTranslated("center", context)!),
                SizedBox(
                  height: 6.h,
                ),
                CustomButton(
                    icon: IconlyLight.location,
                    text:  cubitEditData.accountDataModel?.data?.governmentCenter != null
                        ? cubitEditData.accountDataModel!.data!.governmentCenter
                        .toString()
                        : "Mansoura Center",
                    fontSize: 10.sp,
                    color: Colors.grey),
                SizedBox(
                  height: 10.h,
                ),
                titleWidget(text: getTranslated("job", context)!),
                SizedBox(
                  height: 6.h,
                ),
                CustomButton(
                  icon: Icons.list_alt_sharp,
                  text:  cubitEditData.accountDataModel?.data?.job != null
                      ? cubitEditData.accountDataModel!.data!.job
                      .toString()
                      : "Doctor",
                  fontSize: 10.sp,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                titleWidget(text: getTranslated("contact", context)!),
                SizedBox(
                  height: 6.h,
                ),
                CustomButton(
                  icon: Icons.local_phone_outlined,
                  text:  cubitEditData.accountDataModel?.data?.contact != null
                      ? cubitEditData.accountDataModel!.data!.contact
                      .toString()
                      : "010101010",
                  fontSize: 10.sp,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                titleWidget(text: getTranslated("emergencyContact", context)!),
                SizedBox(
                  height: 6.h,
                ),
                CustomButton(
                  icon: Icons.phone_missed_outlined,
                  text:  cubitEditData.accountDataModel?.data?.emergencyContact != null
                      ? cubitEditData.accountDataModel!.data!.emergencyContact
                      .toString()
                      : "010110000",
                  fontSize: 10.sp,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 45.h,
                ),
                DefultButtonLayoutScreen(
                  text: getTranslated("edit", context)!,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.editProfileRoute);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
