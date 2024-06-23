import 'dart:convert';

import 'package:qr_care/core/Services/Api/api_services.dart';
import 'package:qr_care/core/Services/Api/app_url.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/features/home/features/pofile/Model/accountDataModel.dart';
import 'package:qr_care/features/home/features/pofile/Repo/Repo.dart';
import 'package:http/http.dart' as http;

class EditDataRepo extends EditData {
  @override
  Future<AccountDataModel> getDataUpdate() async {
    // http.Response response = await http.get(Uri.parse("http://192.168.1.4/grd/edit_Accounttt.php?account_id=${CacheHelper.getData(key: 'account_id')}"));
    http.Response response = await http.get(Uri.parse(
        "https://qrlink.icu/edit_Accounttt.php?account_id=${CacheHelper.getData(key: 'account_id')}"));
    var responseBody = jsonDecode(response.body);
    return AccountDataModel.fromJson(responseBody);
  }

  @override
  Future<http.Response> updateDataPerson({
    required String government,
    required String accountId,
    required String city,
    required String governmentCenter,
    required String job,
    required String contact,
    required String emergencyContact,
  }) async {
    String requestBody = jsonEncode({
      //"account_id": "doctor_6606de58.com",
      "account_id": CacheHelper.getData(key: 'account_id'),
      "government": government,
      "city": city,
      "government_center": governmentCenter,
      "job": job,
      "contact": contact,
      "emergency_contact": emergencyContact,
    });

    int contentLength = utf8.encode(requestBody).length;

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
}
