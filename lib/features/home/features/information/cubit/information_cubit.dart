import 'dart:convert';


import 'package:bloc/bloc.dart';


import 'package:dio/dio.dart';


import 'package:equatable/equatable.dart';


import 'package:http/http.dart' as http;


import 'package:qr_care/core/Services/Api/app_url.dart';


import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';


part 'information_state.dart';


class InformationCubit extends Cubit<InformationState> {

  InformationCubit() : super(InformationInitial());


  Future<List<dynamic>?> getMedicalData() async {

    emit(InfoScreenLoading());


    String nationalId = await CacheHelper.getData(key: 'nationalId');


    try {

      final response = await http.get(
          Uri.parse('${ApiUrl.medicalInforamationUrl}?user_id=30205101324567'));


      if (response.statusCode == 200) {

        final jsonData = json.decode(response.body);


        emit(InfoScreenSuccess());


        return jsonData;

      } else {

        throw Exception('Failed to load data');

      }

    } catch (e) {

      emit(InfoScreenError('Failed to load data: $e'));

    }


    return null;

  }


  Future<Map<String, dynamic>?> getPersonalData() async {

    emit(InfoScreenLoading());


    try {

      String accountId = await CacheHelper.getData(key: 'account_id');


      var url =

          Uri.parse('${ApiUrl.personalInforamationUrl}?account_id=$accountId');


      final response = await http.get(url);


      if (response.statusCode == 200) {

        final jsonData = json.decode(response.body);


        emit(InfoScreenSuccess());


        return jsonData;

      } else {

        throw Exception('Failed to load data');

      }

    } catch (e) {

      emit(InfoScreenError('Failed to load data: $e'));

    }


    return null;

  }

}

