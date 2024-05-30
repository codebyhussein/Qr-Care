import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart ' as http;

import 'package:equatable/equatable.dart';

import 'package:qr_care/features/login/domain/entities/user_entity.dart';

import 'package:qr_care/features/register/domain/usecases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());

  final RegisterUseCase registerUseCase;
  static RegisterCubit get(context) => BlocProvider.of(context);

  void signUp({
    required String nationalId,
    required String gender,
    required String job,
    required String governmentCity,
    required String governmentCenter,
    required String contact,
    required String emergencyContact,
    required String password,
    required String confirmPassword,
    required String emergencyName,
    required String governmentNum,
    required File file,
    required String city,
  }) async {
    try {
      emit(RegisterLoading());

      final user = await registerUseCase.registerRepository.signUp(
        nationalId: nationalId,
        gender: gender,
        job: job,
        governmentCity: governmentCity,
        governmentCenter: governmentCenter,
        contact: contact,
        emergencyContact: emergencyContact,
        password: password,
        confirmPassword: confirmPassword,
        emergencyName: emergencyName,
        governmentNum: governmentNum,
        file: file,
        city: city,
      );

      emit(RegisterSuccess(user));
    } catch (e) {
      emit(RegisterFailure(errorMessage: e.toString()));
    }
  }
}
