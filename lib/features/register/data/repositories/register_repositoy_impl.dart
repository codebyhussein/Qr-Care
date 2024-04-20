import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:qr_care/core/Services/Api/app_url.dart';

import 'package:qr_care/features/login/domain/entities/user_entity.dart';
import 'package:qr_care/features/register/data/datasources/register_local_data_source.dart';
import 'package:qr_care/features/register/data/datasources/register_remote_data_source.dart';
import 'package:qr_care/features/register/data/models/user_model.dart';
import 'package:qr_care/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;
  final RegisterLocalDataSource localDataSource;

  const RegisterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Stream<UserEntity> get user {
    return remoteDataSource.user.map((UserModel) {
      if (UserModel != null) {
        localDataSource.write(key: 'user', value: UserModel);
      } else {
        localDataSource.write(key: 'user', value: null);
      }

      return UserModel == null
          ? UserEntity.empty
          : UserEntity.fromJson(UserModel.toJson());
    });
  }

  @override
  Future<UserEntity> signUp({
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
      var request = await ApiUrl.postData(endPoint: ApiUrl.registerUrl);

      request.fields['national_id'] = nationalId;
      request.fields['gender'] = gender;
      request.fields['job'] = job;
      request.fields['government_city'] = governmentCity;
      request.fields['government_center'] = governmentCenter;
      request.fields['contact'] = contact;
      request.fields['emergency_contact'] = emergencyContact;
      request.fields['password'] = password;
      request.fields['confirm_password'] = confirmPassword;
      request.fields['emergency_name'] = emergencyName;
      request.fields['government'] = governmentNum;
      request.fields['city'] = city;

      var imageMultipartFile =
          await http.MultipartFile.fromPath('file', file.path);
      request.files.add(imageMultipartFile);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final json = response.body;
        final user = UserEntity.fromJson(jsonDecode(json));
        return user;
      } else {
        throw Exception(
            'Failed to register. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}
