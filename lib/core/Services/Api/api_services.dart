import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qr_care/core/Services/Api/app_url.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';

class ApiService {
  static Future<http.MultipartRequest> postData(
      {required String endPoint}) async {
    var response = http.MultipartRequest("Post", Uri.parse(endPoint));
    return response;
  }

  static Future<http.Response> postRequest(
      {required String body,
      required Map<String, String> header,
      required String endPoint}) async {
    var response =
        await http.post(Uri.parse(endPoint), body: body, headers: header);
    return response;
  }

  Future<List<dynamic>> getMedicalData({required String qr_data}) async {
    final response = await http
        .get(Uri.parse('${ApiUrl.medicalInforamationUrl}?user_id=$qr_data'));

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map?> getUserData({required String qr_data}) async {
    try {
      var url = Uri.parse('${ApiUrl.getUserData}?national_id=$qr_data');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        return jsonData;
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
    return null;
  }
}
