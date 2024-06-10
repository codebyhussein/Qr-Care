import 'dart:io';
import "package:http/http.dart" as http;
import 'package:qr_care/features/home/features/chaildern/Model/ChildInfoModel.dart';

abstract class AddChildRepo {
  Future<http.Response> addChild(
      {required String childId,
      required File childImageFile,
      required File idImageFile});

  Future<ChildInfoModel>getDataChild();
}
