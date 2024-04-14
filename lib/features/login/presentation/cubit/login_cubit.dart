import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_care/features/login/domain/entities/user_entity.dart';
import 'package:qr_care/features/login/domain/usecases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  final LoginUseCase loginUseCase;

  void signIn({
    required String id,
    required String password,
  }) async {
    try {
      emit(LoginLoading());
      final user =
          await loginUseCase.loginRepository.signIn(id: id, password: password);
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
