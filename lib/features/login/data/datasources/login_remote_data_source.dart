import 'package:qr_care/features/login/data/models/user_model.dart';


abstract class AuthRemoteDataSource {

  Stream<UserModel?> get user;


  Future<UserModel> signIn({

    required String id,

    required String password,

  });

}

