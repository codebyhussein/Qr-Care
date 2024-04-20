import 'package:get_it/get_it.dart';
import 'package:qr_care/features/login/data/datasources/login_local_data_source.dart';
import 'package:qr_care/features/login/data/datasources/login_remote_data_source.dart';
import 'package:qr_care/features/login/data/repositories/login_repository_impl.dart';
import 'package:qr_care/features/login/domain/entities/user_entity.dart';
import 'package:qr_care/features/login/domain/repositories/login_repository.dart';
import 'package:qr_care/features/login/domain/usecases/login_use_case.dart';
import 'package:qr_care/features/login/presentation/cubit/login_cubit.dart';
import 'package:qr_care/features/register/data/datasources/register_local_data_source.dart';
import 'package:qr_care/features/register/data/datasources/register_remote_data_source.dart';
import 'package:qr_care/features/register/data/repositories/register_repositoy_impl.dart';
import 'package:qr_care/features/register/domain/repositories/register_repository.dart';
import 'package:qr_care/features/register/domain/usecases/register_use_case.dart';
import 'package:qr_care/features/register/presentation/cubit/register_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void setup() async {
  // register cubit
  getIt.registerFactory(() => LoginCubit(loginUseCase: getIt()));
  getIt.registerFactory(() => RegisterCubit(registerUseCase: getIt()));

  // usecase
  getIt.registerLazySingleton(() => LoginUseCase(loginRepository: getIt()));
  getIt.registerLazySingleton(
      () => RegisterUseCase(registerRepository: getIt()));

  getIt.registerSingleton<UserEntity>(UserEntity());

// Repositoy
  getIt.registerLazySingleton<LoginRepository>(() =>
      LoginRepositoryImpl(remoteDataSource: getIt(), localDataSource: getIt()));
  getIt.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(
      remoteDataSource: getIt(), localDataSource: getIt()));

// Data Source

  getIt.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(client: getIt()));

  getIt.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSource());
  getIt.registerLazySingleton<RegisterLocalDataSource>(
      () => RegisterLocalDataSource());
//  core for app

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
}
