import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/features/home/Data/Repo/AddChildRepo.dart';

part 'pofile_state.dart';

class PofileCubit extends Cubit<PofileState> {
  PofileCubit({required this.addChildRepo}) : super(PofileInitial());
  AddChildRepo addChildRepo;
static PofileCubit get(context)=>BlocProvider.of(context);
 editAccount({
    required String accountId,
    required String government,
    required String city,
    required String governmentCenter,
    required String job,
    required String contact,
    required String emergencyContact,
  }) async {
    try {
      var response = await addChildRepo.editAccount(
          government: government,
          city: city,
          governmentCenter: governmentCenter,
          job: job,
          contact: contact,
          emergencyContact: emergencyContact, accountId:accountId );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody["status"] == "success") {
          await CacheHelper.saveData(
              key: "city",
              value: responseBody["modified_values"]["government_center"]);
          await CacheHelper.saveData(
              key: "account_id",
              value: responseBody["modified_values"]["account_id"]);
          await CacheHelper.saveData(
              key: "ma", value: responseBody["modified_values"]["job"]);
          print("the data is ${CacheHelper.getData(key: "city")}");
          print("the data is ${CacheHelper.getData(key: "ma")}");
          print("the data is ${CacheHelper.getData(key: "account_id")}");
          emit(SuccessEditUser());
        } else {
          print("the error meassage${responseBody["message"]}");
          emit(ErrorEditUser(error: responseBody["message"]));
        }
      } else {
        print("the error meassage${response.statusCode}");

        emit(ErrorEditUser(
            error: 'Failed to add child. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      print("the error meassage${e.toString()}");

      emit(ErrorEditUser(error: 'Error: $e'));
    }
  }

}
