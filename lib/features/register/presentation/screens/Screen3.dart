import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/app_widgets.dart';
import 'package:qr_care/features/register/presentation/widgets/Slider.dart';
import 'package:qr_care/features/register/presentation/widgets/custom_appbar_register_screen.dart';
import 'package:qr_care/features/widgets/CustomTextFormField.dart';
import 'package:qr_care/features/widgets/defult_button.dart';
import 'package:qr_care/features/widgets/dropdwan_button.dart';

class Screen3 extends StatefulWidget {
  Screen3({super.key});
  bool isLoading = false;
  @override
  State<Screen3> createState() => _Screen2State();
}

class _Screen2State extends State<Screen3> {
  TextEditingController governorateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController centerController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const CustomAppBarRegister(),
              CustomSlider(value: 3),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: AppWidgets.defultTextRegister(
                  text: getTranslated("address", context)!,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: AppWidgets.defultdesrptionRegister(
                    text: getTranslated("addressDesc", context)!),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.defultText(
                        text: getTranslated("governorate", context)!),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                        errorMassage:
                            getTranslated("errorGovernorate", context)!,
                        hintText: getTranslated("chooseGovernorate", context)!,
                        helpText: getTranslated("helpGovernorate", context)!,
                        regEx: AppConst.governoratePattern,
                        nameofController: governorateController,
                        keyBoredType: TextInputType.number,
                        isvisble: false),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppWidgets.defultText(
                        text: getTranslated("city", context)!),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: DefaultDropdown(
                          hintText: getTranslated("selectCity", context)!,
                          errorMassage: getTranslated("errorCity", context)!,
                          controllerName: cityController,
                          listName: cities,
                          onChanged: (value) {
                            cityController.text = value!;
                          }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppWidgets.defultText(
                        text: getTranslated("center", context)!),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              Center(
                child: DefaultDropdown(
                    hintText: getTranslated("selectCenter", context)!,
                    errorMassage: getTranslated("errorCenter", context)!,
                    controllerName: cityController,
                    listName: cities,
                    onChanged: (value) {
                      cityController.text = value!;
                    }),
              ),
              SizedBox(
                height: 85.h,
              ),
              Center(
                child: DefultButton(
                  text: getTranslated("next", context)!,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await CacheHelper.saveData(
                          key: 'governorate',
                          value: governorateController.text);
                      await CacheHelper.saveData(
                          key: 'city', value: cityController.text);
                      await CacheHelper.saveData(
                          key: 'center', value: centerController.text);
                      Navigator.pushNamed(context, Routes.registerRoute4);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
