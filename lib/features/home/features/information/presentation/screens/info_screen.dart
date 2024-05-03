import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_care/config/Localization/Constraine.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/core/app_color.dart';
import 'package:qr_care/core/app_constant.dart';
import 'package:qr_care/core/assets/assets_manager.dart';
import 'package:qr_care/features/home/features/information/cubit/information_cubit.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/medical_information_widget.dart';
import 'package:qr_care/features/home/features/information/presentation/widgets/personal_information_widget.dart';
import 'package:qr_care/features/home/widgets/custom_appbar.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String name = '';
  String dateOfBirth = '';
  String jop = '';
  String nationalId = '';
  String phoneNumber = '';

  @override
  void initState() {
    // BlocProvider.of<InformationCubit>(context).getPersonalData();
    // getPersonaldataFromCahe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              CustomAppBarLayoutScreen(
                title: getTranslated("Information", context)!,
              ),
              SizedBox(
                height: 42.h,
              ),
              Center(child: SvgPicture.asset(AppAssets.logoBath)),
              SizedBox(
                height: 27.h,
              ),

              // PersonalInformationWidget(
              //   data_of_birth: dateOfBirth,
              //   jop: jop,
              //   national_id: nationalId,
              //   name: name,
              //   phone_number: phoneNumber,
              // ),

              FutureBuilder(
                  future: BlocProvider.of<InformationCubit>(context)
                      .getMedicalData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return MedicalInformationWidget(
                        height: data[0]['height'].toString(),
                        boold_type: data[0]['blood_type'] ?? 'A',
                        chronic_disease: data[0]['chronic_disease'],
                        width: data[0]['weight'].toString(),
                        medical_analysis:
                            data[0]['medical_analysis'] ?? 'not found',
                        Allergies: data[0]['Allergies'] ?? 'Anaphylaxis',
                        x_ray_image: data[0]['x_ray_image'] ??
                            "assets/images/not-found.jpg",
                        Type_of_allergy:
                            data[0]['Type_of_allergy'] ?? 'cytotoxic reactions',
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  })

              // EmergencyInformationWidget(),
            ],
          ),
        ));
  }

  // Future getPersonaldataFromCahe() async {
  //   name = await CacheHelper.getData(key: 'nameh');
  //   nationalId = await CacheHelper.getData(key: 'national_id');
  //   dateOfBirth = await CacheHelper.getData(key: 'date_of_birth');
  //   jop = await CacheHelper.getData(key: 'jop');
  //   phoneNumber = await CacheHelper.getData(key: 'contact');
  // }
}
