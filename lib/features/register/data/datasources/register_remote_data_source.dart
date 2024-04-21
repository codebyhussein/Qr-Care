// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:qr_care/core/Services/Api/app_url.dart';
// import 'package:qr_care/features/register/data/models/user_model.dart';

// abstract class RegisterRemoteDataSource {
//   Stream<UserModel?> get user;

//   Future<UserModel> signUp(
//       {required String nationalId,
//       required String gender,
//       required String job,
//       required String governmentCity,
//       required String governmentCenter,
//       required String contact,
//       required String emergencyContact,
//       required String password,
//       required String confirmPassword,
//       required String emergencyName,
//       required String governmentNum,
//       required File file,
//       required String city});
// }

// class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
//   final http.Client _client;

//   const RegisterRemoteDataSourceImpl({
//     required http.Client client,
//   }) : _client = client;

//   @override
//   Stream<UserModel?> get user {
//     return _client.post(Uri.parse(ApiUrl.registerUrl)).asStream().transform(
//       StreamTransformer<http.Response, UserModel?>.fromHandlers(
//         handleData: (http.Response response, EventSink<UserModel?> sink) {
//           if (response.statusCode == 200) {
//             final json = jsonDecode(response.body);
//             if (json['status'] == 'success') {
//               final user = UserModel.fromJson(json);
//               sink.add(user);
//             } else {
//               final errorMessage = json['message'];
//               sink.addError(errorMessage);
//             }
//           } else {
//             sink.addError('Failed to get user');
//           }
//         },
//       ),
//     );
//   }

//   @override
//   Future<UserModel> signUp({
//     required String nationalId,
//     required String gender,
//     required String job,
//     required String governmentCity,
//     required String governmentCenter,
//     required String contact,
//     required String emergencyContact,
//     required String password,
//     required String confirmPassword,
//     required String emergencyName,
//     required String governmentNum,
//     required String city,
//     required File file,
//   }) async {
//     final response = await _client.post(
//       Uri.parse(ApiUrl.registerUrl),
//       body: {
//         'gender': gender,
//         'national_id': nationalId,
//         'password': password,
//         'job': job,
//         'confirm_password': confirmPassword,
//         'emergency_name': emergencyName,
//         'contact': contact,
//         "government_city": governmentCity,
//         'government_center': governmentCenter,
//         'file': file,
//         'city': city,
//         'government': governmentNum,
//         'emergency_contact': emergencyContact,
//       },
//     );

//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body);
//       if (json['status'] == 'fail') {
//         final errorMessage = json['message'];
//         return Future.error(errorMessage);
//       }
//       final user = UserModel.fromJson(json);
//       return user;
//     } else {
//       return Future.error('Failed to regiter please try again');
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:qr_care/core/Services/Api/app_url.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/features/register/data/models/user_model.dart';

abstract class RegisterRemoteDataSource {
  Stream<UserModel?> get user;

  Future<UserModel> signUp({
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
  });
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final http.Client _client;

  const RegisterRemoteDataSourceImpl({
    required http.Client client,
  }) : _client = client;

  @override
  Stream<UserModel?> get user {
    return _client.post(Uri.parse(ApiUrl.registerUrl)).asStream().transform(
      StreamTransformer<http.Response, UserModel?>.fromHandlers(
        handleData: (http.Response response, EventSink<UserModel?> sink) {
          if (response.statusCode == 200) {
            final json = jsonDecode(response.body);
            if (json['status'] == 'success') {
              final user = UserModel.fromJson(json);
              sink.add(user);
            } else {
              final errorMessage = json['message'];
              sink.addError(errorMessage);
            }
          } else {
            sink.addError('Failed to get user');
          }
        },
      ),
    );
  }

  @override
  Future<UserModel> signUp({
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
    required String city,
    required File file,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiUrl.registerUrl),
    );
    request.fields['gender'] = gender;
    request.fields['national_id'] = nationalId;
    request.fields['password'] = password;
    request.fields['job'] = job;
    request.fields['confirm_password'] = confirmPassword;
    request.fields['emergency_name'] = emergencyName;
    request.fields['contact'] = contact;
    request.fields['government_city'] = governmentCity;
    request.fields['government_center'] = governmentCenter;
    request.fields['city'] = city;
    request.fields['government'] = governmentNum;
    request.fields['emergency_contact'] = emergencyContact;

    var imageMultipartFile =
        await http.MultipartFile.fromPath('file', file.path);
    request.files.add(imageMultipartFile);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['status'] == 'fail') {
        final errorMessage = json['message'];
        return Future.error(errorMessage);
      }
      final user = UserModel.fromJson(json);
      CacheHelper.saveData(
          key: 'account_id', value: json['entered_values']['account_id']);
      return user;
    } else {
      return Future.error('Failed to register. Please try again.');
    }
  }
}
