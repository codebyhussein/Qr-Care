import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qr_care/core/Services/Api/app_url.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/features/register/data/models/user_model.dart';

abstract class LoginRemoteDataSource {
  Stream<UserModel?> get user;

  Future<UserModel> signIn({
    required String id,
    required String password,
  });
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client _client;

  const LoginRemoteDataSourceImpl({
    required http.Client client,
  }) : _client = client;

  @override
  Stream<UserModel?> get user {
    // TODO: Implement the get user stream.
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signIn({
    required String id,
    required String password,
  }) async {
    final response = await _client.post(
      Uri.parse(ApiUrl.loginUrl),
      body: {'account_id': id, 'password': password},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['status'] == 'fail') {
        final errorMessage = json['message'];
        return Future.error(errorMessage);
      }
      final user = UserModel.fromJson(json);
      CacheHelper.saveData(
          key: 'account_id', value: json['entered_values']['account_id']);
      CacheHelper.saveData(
          key: 'nationalId', value: json['entered_values']['national_id']);
      return user;
    } else {
      return Future.error('Failed to sign in');
    }
  }
}
