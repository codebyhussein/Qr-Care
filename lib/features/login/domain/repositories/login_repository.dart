import 'package:qr_care/features/login/domain/entities/user_entity.dart';


abstract class LoginRepository {

  Stream<UserEntity> get user;


  Future<UserEntity> signIn({

    required String id,

    required String password,

  });

}
