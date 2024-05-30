import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_care/core/Services/LocalService/Cache_Helper.dart';
import 'package:qr_care/features/home/Data/Repo/AddChildRepo.dart';

import 'package:http/http.dart' as http;
import '../../../../../core/Services/Api/app_url.dart';

part 'pofile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.addChildRepo}) : super(PofileInitial());
  AddChildRepo addChildRepo;
  static ProfileCubit get(context) => BlocProvider.of(context);
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
          emergencyContact: emergencyContact,
          accountId: accountId);

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

          emit(SuccessEditUser());
        } else {
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

  Future<Map?> getUserData() async {
    emit(ProfileLoading());

    try {
      String nationalId = await CacheHelper.getData(key: 'nationalId');

      var url = Uri.parse(
          '${ApiUrl.personalInforamationUrl}?national_id=30215115516');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        emit(ProfileSuccess());

        return jsonData;
      } else {
        emit(const ProfileError('Failed to load data:  '));
      }
    } catch (e) {
      emit(ProfileError('Failed to load data: $e'));
    }

    return null;
  }
}
