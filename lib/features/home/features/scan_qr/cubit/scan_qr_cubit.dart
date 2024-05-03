import 'dart:convert';


import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:http/http.dart' as http;


import 'package:bloc/bloc.dart';


import 'package:equatable/equatable.dart';


import 'package:qr_care/core/Services/Api/app_url.dart';


part 'scan_qr_state.dart';


class ScanQrCubit extends Cubit<ScanQrState> {

  ScanQrCubit() : super(ScanQrInitial());


  static ScanQrCubit get(context) => BlocProvider.of(context);


  Future<dynamic> getMedicalData({required String qrDataById}) async {

    emit(ScanQrLoading());


    try {

      final response = await http.get(

          Uri.parse('${ApiUrl.medicalInforamationUrl}?user_id=$qrDataById'));


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

}

