import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_care/config/Localization/AppLocalizations.dart';
import 'package:qr_care/config/Localization/cubit/change_lang_cubit.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/core/ServicesLocator.dart';
import 'package:qr_care/features/forgetPassword/cubit/forgetpassword_cubit.dart';
import 'package:qr_care/features/forgetPassword/cubit/resetpassword_cubit.dart';
import 'package:qr_care/features/forgetPassword/cubit/verificationpassword_cubit.dart';
import 'package:qr_care/features/home/Data/Repo/AddChildRepoImplementation.dart';
import 'package:qr_care/features/home/features/chaildern/cubit/chaildern_cubit.dart';
import 'package:qr_care/features/home/features/information/cubit/information_cubit.dart';
import 'package:qr_care/features/home/features/pofile/cubit/pofile_cubit.dart';
import 'package:qr_care/core/injection_container.dart' as injection;
import 'package:qr_care/config/themes/app_themes.dart';
import 'package:qr_care/features/home/features/scan_qr/cubit/scan_qr_cubit.dart';
import 'package:qr_care/features/login/presentation/cubit/login_cubit.dart';
import 'package:qr_care/features/register/presentation/cubit/register_cubit.dart';
import 'package:qr_care/features/splash/splash_screen.dart';

class QrCare extends StatelessWidget {
  const QrCare({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
          create: (BuildContext context) => injection.getIt<RegisterCubit>(),
        ),
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => injection.getIt<LoginCubit>(),
        ),
        BlocProvider<ForgetpasswordCubit>(
          create: (BuildContext context) => ForgetpasswordCubit(),
        ),
        BlocProvider<ResetpasswordCubit>(
          create: (BuildContext context) => ResetpasswordCubit(),
        ),
        BlocProvider<InformationCubit>(
          create: (BuildContext context) => InformationCubit(),
        ),
        BlocProvider<VerificationpasswordCubit>(
          create: (BuildContext context) => VerificationpasswordCubit(),
        ),
        BlocProvider<ScanQrCubit>(
          create: (BuildContext context) => ScanQrCubit(),
        ),
        BlocProvider<ChangeLangCubit>(
          create: (context) =>
              ChangeLangCubit()..appLanguage(EventToChangeLang.initChangeLange),
        ),
        BlocProvider<ChaildernCubit>(
            create: (context) => ChaildernCubit(
                addChildRepo:
                    ServicesLocator.getIt.get<AddChildRepoImplementation>())..getChildInfo()),

        BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(
                addChildRepo:
                    ServicesLocator.getIt.get<AddChildRepoImplementation>())..getUserData()),
      ],
      child: BlocBuilder<ChangeLangCubit, ChangeLangState>(
        builder: (context, state) {
          if (state is ChangeLang) {
            return ScreenUtilInit(
              designSize: const Size(360, 800),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return GetMaterialApp(
                  locale: Locale(state.language),
                  supportedLocales: const [
                    Locale("en"),
                    Locale("ar"),
                  ],
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate
                  ],
                  localeListResolutionCallback:
                      (deviceLocale, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (deviceLocale != null) {
                        if (deviceLocale[0].languageCode ==
                            locale.languageCode) {
                          return deviceLocale[0];
                        }
                      }
                    }
                    return supportedLocales.first;
                  },
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                  debugShowCheckedModeBanner: false,
                  home: const SplahScreen(),
                  theme: appthemes(),
                );
              },
            );
          }
          return ScreenUtilInit(
            designSize: const Size(360, 800),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return GetMaterialApp(
                supportedLocales: const [
                  Locale("en"),
                  Locale("ar"),
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                localeListResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null) {
                      if (deviceLocale[0].languageCode == locale.languageCode) {
                        return deviceLocale[0];
                      }
                    }
                  }
                  return supportedLocales.first;
                },
                onGenerateRoute: AppRoutes.onGenerateRoute,
                debugShowCheckedModeBanner: false,
                home: const SplahScreen(),
                theme: appthemes(),
              );
            },
          );
        },
      ),
    );
  }
}
