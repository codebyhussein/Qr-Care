import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:qr_care/features/login/injection_container.dart';

import 'package:shared_preferences/shared_preferences.dart';


part 'verificationpassword_state.dart';


class VerificationpasswordCubit extends Cubit<VerificationpasswordState> {

  VerificationpasswordCubit() : super(VerificationpasswordInitial());


  void verificationFun({required String code}) {

    final sharedPreferences = getIt<SharedPreferences>();


    late String? verificationCode =

        sharedPreferences.getString('verification_code');


    try {

      emit(VerificationpasswordLoading());


      if (verificationCode == code) {

        emit(const VerificationpasswordSuccess(
            msg: 'verification code correct'));

      } else {

        emit(const VerificationpasswordFailure(

            errorMessage: 'Please enter verification code correct'));

      }

    } catch (e) {}

  }

}

