import 'dart:convert';

import 'package:http/http.dart' as http;

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
}
