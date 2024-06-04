import 'dart:convert';
import 'dart:io';
import 'package:qr_care/core/Services/Api/api_services.dart';
import 'package:qr_care/core/Services/Api/app_url.dart';
import 'package:qr_care/features/home/Data/Repo/AddChildRepo.dart';
import 'package:http/http.dart' as http;
import 'package:qr_care/features/home/features/chaildern/Model/ChildInfoModel.dart';

class AddChildRepoImplementation extends AddChildRepo {
  AddChildRepoImplementation({required this.apiUrl});

  ApiUrl apiUrl;

  @override
  Future<http.Response> addChild({required String childId,
    required File childImageFile,
    required File idImageFile}) async {
    var request = await ApiService.postData(endPoint: ApiUrl.addChildUrl);
    var childImageMultipartFile =
    await http.MultipartFile.fromPath('child_image', childImageFile.path);
    var idImageMultipartFile =
    await http.MultipartFile.fromPath('id_image', idImageFile.path);
    request.fields['child_id'] = childId;
    request.files.add(childImageMultipartFile);
    request.files.add(idImageMultipartFile);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    return response;
  }

  @override
  Future<http.Response> editAccount({
    required String accountId,
    required String government,
    required String city,
    required String governmentCenter,
    required String job,
    required String contact,
    required String emergencyContact,
  }) async {
    String requestBody = jsonEncode({
      "account_id": accountId,
      "government": government,
      "city": city,
      "government_center": governmentCenter,
      "job": job,
      "contact": contact,
      "emergency_contact": emergencyContact,
    });

    int contentLength = utf8
        .encode(requestBody)
        .length;

    var response = await ApiService.postRequest(
      endPoint: ApiUrl.editAccountUrl,
      header: {
        'Content-Type': 'application/json',
        'Content-Length': '$contentLength',
      },
      body: requestBody,
    );

    return response;
  }

  @override
  Future<ChildInfoModel> getDataChild() async {
    final response = await http.get(Uri.parse(
        "http://192.168.1.4/grd/personal_child.php?national_id=12345678901234"));

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return ChildInfoModel.fromJson(responseBody);
    } else {
      throw Exception('Failed to load child info');
    }
  }

}
