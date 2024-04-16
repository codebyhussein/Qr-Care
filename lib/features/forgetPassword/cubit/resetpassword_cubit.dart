import 'dart:convert';


import 'package:bloc/bloc.dart';


import 'package:equatable/equatable.dart';


import 'package:http/http.dart' as http;


import 'package:qr_care/core/Services/Api/app_url.dart';


part 'resetpassword_state.dart';


class ResetpasswordCubit extends Cubit<ResetpasswordState> {

  ResetpasswordCubit() : super(ResetpasswordInitial());


  // Future<void> resetPassword(


  //     {required String newPassword,


  //     required String confirmPassword,


  //     required String verificationCode,


  //     required String phoneNumber}) async {


  //   try {


  //     emit(ResetpasswordLoading());


  //     final url = Uri.parse(ApiUrl.resetPasswordUrl);


  //     final response = await http.post(


  //       url,


  //       body: {


  //         "new_password": newPassword,


  //         "confirm_password": confirmPassword,


  //         "verification_code": verificationCode,


  //         "contact": phoneNumber,


  //       },


  //     );


  //     if (response.statusCode == 200) {


  //       final jsonResponse = json.decode(response.body);


  //       if (jsonResponse['status'] == "success") {


  //         final msg = jsonResponse['message'];


  //         emit(ResetpasswordSuccess(msg: msg));


  //       }


  //       if (jsonResponse['status'] == "fail") {


  //         String msg = jsonResponse['message'];


  //         emit(ResetpasswordFailure(errorMessage: msg));


  //       }


  //     }


  //   } catch (e) {


  //     emit(ResetpasswordFailure(errorMessage: e.toString()));


  //   }


  // }


  Future<void> resetPassword(

      {required String newPassword,

      required String confirmPassword,

      required String verificationCode,

      required String phoneNumber}) async {

    try {

      emit(ResetpasswordLoading());

      final url = Uri.parse(ApiUrl.resetPasswordUrl);

      if (newPassword != confirmPassword) {

        emit(const ResetpasswordFailure(errorMessage: 'Passwords must match'));

        return;

      }

      final response = await http.post(

        url,

        body: {

          "new_password": newPassword,

          "confirm_password": confirmPassword,

          "verification_code": verificationCode,

          "contact": phoneNumber,

        },

      );

      if (response.statusCode == 200) {

        final jsonResponse = json.decode(response.body);

        if (jsonResponse['status'] == "success") {

          final msg = jsonResponse['message'];

          emit(ResetpasswordSuccess(msg: msg));

        } else if (jsonResponse['status'] == "fail") {

          String msg = jsonResponse['message'];

          emit(ResetpasswordFailure(errorMessage: msg));

        }

      }

    } catch (e) {

      emit(ResetpasswordFailure(errorMessage: e.toString()));

    }

  }

}

