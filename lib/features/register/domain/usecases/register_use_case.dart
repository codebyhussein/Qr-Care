import 'dart:io';
import 'package:qr_care/features/login/domain/entities/user_entity.dart';
import 'package:qr_care/features/register/domain/repositories/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository registerRepository;

  RegisterUseCase({required this.registerRepository});

  Future<UserEntity> call(SignUpParams params) async {
    try {
      return await registerRepository.signUp(
          nationalId: params.nationalId,
          password: params.password,
          gender: params.gender,
          job: params.job,
          governmentCity: params.governmentCity,
          governmentCenter: params.governmentCenter,
          contact: params.contact,
          emergencyContact: params.emergencyContact,
          confirmPassword: params.confirmPassword,
          emergencyName: params.emergencyName,
          governmentNum: params.governmentNum,
          file: params.file,
          city: params.city);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class SignUpParams {
  final String nationalId;
  final String gender;
  final String job;
  final String governmentCity;
  final String governmentCenter;
  final String contact;
  final String emergencyContact;
  final String password;
  final String confirmPassword;
  final String emergencyName;
  final String governmentNum;
  final File file;
  final String city;

  SignUpParams(
      {required this.nationalId,
      required this.gender,
      required this.job,
      required this.governmentCity,
      required this.governmentCenter,
      required this.contact,
      required this.emergencyContact,
      required this.password,
      required this.confirmPassword,
      required this.emergencyName,
      required this.governmentNum,
      required this.file,
      required this.city});
}
