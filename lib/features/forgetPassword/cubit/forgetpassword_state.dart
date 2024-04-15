part of 'forgetpassword_cubit.dart';

abstract class ForgetpasswordState extends Equatable {
  const ForgetpasswordState();

  @override
  List<Object> get props => [];
}

class ForgetpasswordInitial extends ForgetpasswordState {}

class ForgetpasswordLoading extends ForgetpasswordState {}

class ForgetpasswordSuccess extends ForgetpasswordState {
  final String msg;

  const ForgetpasswordSuccess({required this.msg});

  @override
  List<Object> get props => [msg];
}

class ForgetpasswordFailure extends ForgetpasswordState {
  final String errorMessage;

  const ForgetpasswordFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
