import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/features/home/features/pofile/Model/accountDataModel.dart';
import 'package:qr_care/features/home/features/pofile/Repo/Repo.dart';

part 'edit_account_state.dart';

class EditAccountCubit extends Cubit<EditAccountState> {
  EditAccountCubit({required this.editData}) : super(EditAccountInitial());
  EditData editData;

  static EditAccountCubit get(context) => BlocProvider.of(context);
  AccountDataModel? accountDataModel;

  void editAccount({
    required String accountId,
    required String government,
    required String city,
    required String governmentCenter,
    required String job,
    required String contact,
    required String emergencyContact,
  }) async {
    try {
      var response = await editData.updateDataPerson(
        accountId: accountId,
        government: government,
        city: city,
        governmentCenter: governmentCenter,
        job: job,
        contact: contact,
        emergencyContact: emergencyContact,
      );

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
          await getDataEdit();
          emit(SuccessEditUser());
        } else {
          emit(ErrorEditUser(error: responseBody["message"]));
        }
      } else {
        log("the error meassage${response.statusCode}");

        emit(ErrorEditUser(
            error: 'Failed to add child. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      log("the error meassage${e.toString()}");

      emit(ErrorEditUser(error: 'Error: $e'));
    }
  }

  Future<void> getDataEdit() async {
    emit(EditAccountLoading());
    try {
      accountDataModel = await editData.getDataUpdate();
      log(accountDataModel!.status.toString());
      emit(EditAccountSuccess());
    } catch (e) {
      log(e.toString());
      emit(EditAccountError(error: e.toString()));
    }
  }
}
