
import 'package:get_it/get_it.dart';
import 'package:qr_care/core/Services/Api/app_url.dart';
import 'package:qr_care/features/home/Data/Repo/AddChildRepoImplementation.dart';
import 'package:qr_care/features/home/features/pofile/Repo/RepoImplementation.dart';
// import 'package:qr_care/features/home/features/chaildern/Data/Repo/AddChildRepoImplementation.dart';

class ServicesLocator {
  static final getIt = GetIt.instance;

  static void setupServiceLocator() {
    getIt.registerSingleton<ApiUrl>(ApiUrl());
    getIt.registerSingleton<AddChildRepoImplementation>(AddChildRepoImplementation(
      apiUrl: getIt.get<ApiUrl>(),
    ));

  }
  static void setupServicesData() {
    getIt.registerSingleton<EditDataRepo>(EditDataRepo());
  }
}