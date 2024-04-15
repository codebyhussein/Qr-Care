import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:qr_care/core/Services/Api/app_url.dart';
part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  ForgetpasswordCubit() : super(ForgetpasswordInitial());

  Future<void> forgotPassword({required String phoneNumber}) async {
    emit(ForgetpasswordLoading());

    try {
      final response = await http.post(
        Uri.parse(ApiUrl.forgetPasswordUrl),
        body: {"contact": phoneNumber},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == "success") {
          emit(const ForgetpasswordSuccess(msg: 'Please check your code in'));
        } else {
          emit(const ForgetpasswordFailure(
              errorMessage: "please enter correct phone"));
        }
      }
    } catch (e) {
      emit(ForgetpasswordFailure(errorMessage: 'An error occurred: $e'));
    }
  }
}
