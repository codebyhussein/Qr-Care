import 'dart:convert';


import 'package:http/http.dart' as http;


import 'package:bloc/bloc.dart';


import 'package:equatable/equatable.dart';


import 'package:qr_care/core/Services/Api/app_url.dart';


part 'scan_qr_state.dart';


class ScanQrCubit extends Cubit<ScanQrState> {

  ScanQrCubit() : super(ScanQrInitial());


  Future<List<dynamic>?> getMedicalData({required String qrDataById}) async {

    emit(ScanQrLoading());


    try {

      final response = await http.get(Uri.parse(

          'http://192.168.1.17/grd/medical_information.php?user_id=$qrDataById'));


      if (response.statusCode == 200) {

        final jsonData = json.decode(response.body);


        emit(ScanQrSuccess(jsonData));

        return jsonData;

      } else {

        throw Exception('Failed to load data');

      }

    } catch (e) {

      emit(ScanQrError('Failed to load data: $e'));

    }


    return null;


    //return null;

  }


  Future<List<dynamic>?> getPersonalData(

      {required String qrDataByAccountId}) async {

    emit(ScanQrLoading());


    try {

      var url = Uri.parse(ApiUrl.personalInforamationUrl);


      final response =

          await http.post(url, body: {'account_id': qrDataByAccountId});


      if (response.statusCode == 200) {

        final jsonData = json.decode(response.body);


        emit(ScanQrSuccess(jsonData));

      } else {

        throw Exception('Failed to load data');

      }

    } catch (e) {

      emit(ScanQrError('Failed to load data: $e'));

    }


    return null;

  }

}

