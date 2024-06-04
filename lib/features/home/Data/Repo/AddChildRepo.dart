import 'dart:io';
import "package:http/http.dart" as http;
import 'package:qr_care/features/home/features/chaildern/Model/ChildInfoModel.dart';

abstract class AddChildRepo {
  Future<http.Response> addChild(
      {required String childId,
      required File childImageFile,
      required File idImageFile});

  Future<dynamic> editAccount({
    required String accountId,
    required String government,
    required String city,
    required String governmentCenter,
    required String job,
    required String contact,
    required String emergencyContact,
  });
  Future<ChildInfoModel>getDataChild();
}
