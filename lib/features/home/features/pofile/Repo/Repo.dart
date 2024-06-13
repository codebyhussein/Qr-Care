import 'package:qr_care/features/home/features/pofile/Model/accountDataModel.dart';
import "package:http/http.dart"as http;
abstract class EditData{
  Future<AccountDataModel> getDataUpdate();
  Future<http.Response>updateDataPerson({
    required String government ,
    required String accountId ,
    required String city,
    required String governmentCenter,
    required String job,
    required String contact,
    required String emergencyContact,
});
}

