import 'package:qr_care/features/login/domain/entities/user_entity.dart';

import 'package:qr_care/features/login/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<UserEntity> call(SignInParams params) async {
    try {
      return await loginRepository.signIn(
        id: params.id,
        password: params.password,
      );
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class SignInParams {
  final String id;

  final String password;

  SignInParams({
    required this.id,
    required this.password,
  });
}
