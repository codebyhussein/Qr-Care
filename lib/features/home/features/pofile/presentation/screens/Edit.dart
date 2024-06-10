import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';

import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/features/forgetPassword/presentation/widgets/custom_appbar.dart';
import 'package:qr_care/features/home/features/pofile/cubit/EditAccount/edit_account_cubit.dart';
import 'package:qr_care/features/home/features/pofile/cubit/pofile_cubit.dart';
import 'package:qr_care/features/home/features/pofile/presentation/widgets/textWidget.dart';
import 'package:qr_care/features/home/features/scan_qr/presentation/widgets/defult_botton.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/dropdwan_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController governmentController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController centerController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    governmentController.dispose();
    cityController.dispose();
    centerController.dispose();
    jobController.dispose();
    MobileController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> cities = [
      getTranslated("Cairo", context)!,
      getTranslated("Giza", context)!,
      getTranslated("Luxor", context)!,
      getTranslated("Alexandria", context)!,
      getTranslated("PortSaid", context)!,
      getTranslated("Ismailia", context)!,
      getTranslated("Mansoura", context)!,
      getTranslated("Tanta", context)!,
    ];
    List<String> jobs = [
      getTranslated("Doctor", context)!,
      getTranslated("AdministrativeServices", context)!,
      getTranslated("OfficeServices", context)!,
      getTranslated("Others", context)!,
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              CustomAppBar(
                title: getTranslated("MyAccount", context)!,
              ),
              SizedBox(
                height: 10.h,
              ),
              titleWidget(text: getTranslated("governorate", context)!),
              SizedBox(
                height: 6.h,
              ),
              DefaultDropdown(
                  hintText: getTranslated("chooseGovernorate", context)!,
                  errorMassage: getTranslated("errorMessageJob", context)!,
                  controllerName: governmentController,
                  listName: cities,
                  onChanged: (value) {
                    governmentController.text = value!;
                  }),
              SizedBox(
                height: 10.h,
              ),
              titleWidget(text: getTranslated("city", context)!),
              SizedBox(
                height: 6.h,
              ),
              DefaultDropdown(
                  hintText: getTranslated("selectCity", context)!,
                  errorMassage: getTranslated("errorMessageCity", context)!,
                  controllerName: cityController,
                  listName: cities,
                  onChanged: (value) {
                    cityController.text = value!;
                  }),
              SizedBox(
                height: 10.h,
              ),
              titleWidget(
                text: getTranslated("center", context)!,
              ),
              SizedBox(
                height: 6.h,
              ),
              DefaultDropdown(
                  hintText: getTranslated("selectCenter", context)!,
                  errorMassage: getTranslated("errorMessageCenter", context)!,
                  controllerName: centerController,
                  listName: cities,
                  onChanged: (value) {
                    centerController.text = value!;
                  }),
              SizedBox(
                height: 10.h,
              ),
              titleWidget(text: getTranslated("job", context)!),
              SizedBox(
                height: 6.h,
              ),
              DefaultDropdown(
                  hintText: getTranslated("chooseJob", context)!,
                  errorMassage: getTranslated("errorMessageJob", context)!,
                  controllerName: jobController,
                  listName: jobs,
                  onChanged: (value) {
                    jobController.text = value!;
                  }),
              SizedBox(
                height: 10.h,
              ),
              titleWidget(text: getTranslated("contact", context)!),
              SizedBox(
                height: 6.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomTextFormField(
                    regEx: AppConst.phonePattern,
                    prefixIcon: const Icon(IconlyLight.call),
                    hintText: getTranslated("phone", context)!,
                    errorMassage: getTranslated("errorMessagePhone", context)!,
                    nameofController: phoneController,
                    keyBoredType: TextInputType.number,
                    isvisble: false),
              ),
              SizedBox(
                height: 10.h,
              ),
              titleWidget(text: getTranslated("emergencyContact", context)!),
              SizedBox(
                height: 6.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomTextFormField(
                  regEx: AppConst.phonePattern,
                  prefixIcon: const Icon(IconlyLight.call),
                  hintText: getTranslated("PhoneHome", context)!,
                  errorMassage: getTranslated("errorMessagePhone", context)!,
                  nameofController: MobileController,
                  keyBoredType: TextInputType.number,
                  isvisble: false,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              BlocConsumer<EditAccountCubit, EditAccountState>(
                listener: (context, state) {
                  if (state is ErrorEditUser) {
                    Get.snackbar("error", state.error.toString());
                  } else if (state is SuccessEditUser) {
                    AppConst.showMessage(
                        msg: ' Child Added Successfully', context: context);
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  var cubit = EditAccountCubit.get(context);
                  return DefultButtonLayoutScreen(
                    text: getTranslated("save", context)!,
                    onPressed: () async {
                      String accountId =
                          await CacheHelper.getData(key: 'account_id');
                      if (formKey.currentState!.validate()) {
                        cubit.editAccount(
                            // accountId: accountId,
                            government: governmentController.text,
                            city: cityController.text,
                            governmentCenter: centerController.text,
                            job: jobController.text,
                            contact: phoneController.text,
                            emergencyContact: MobileController.text);
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
