import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_care/config/Localization/AppLocalizations.dart';
import 'package:qr_care/config/Localization/cubit/change_lang_cubit.dart';
import 'package:qr_care/config/routes/app_routes.dart';
import 'package:qr_care/features/login/injection_container.dart' as injection;

import 'package:qr_care/config/themes/app_themes.dart';
import 'package:qr_care/features/login/presentation/cubit/login_cubit.dart';

import 'package:qr_care/features/splash/splash_screen.dart';

class QrCare extends StatelessWidget {
  const QrCare({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => injection.getIt<LoginCubit>(),
        ),
        BlocProvider<ChangeLangCubit>(
          create: (context) =>
              ChangeLangCubit()..appLanguage(EventToChangeLang.initChangeLange),
        )
      ],
      child: BlocBuilder<ChangeLangCubit, ChangeLangState>(
        builder: (context, state) {
          if (state is ChangeLang) {
            return ScreenUtilInit(
              designSize: const Size(360, 800),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return MaterialApp(
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
              return MaterialApp(
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
