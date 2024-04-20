import 'dart:io';

import 'package:qr_care/features/login/domain/entities/user_entity.dart';

abstract class RegisterRepository {
  Stream<UserEntity> get user;

  Future<UserEntity> signUp(
      {required String nationalId,
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
      required String city});
}
