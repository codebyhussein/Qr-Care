part of 'resetpassword_cubit.dart';

sealed class ResetpasswordState extends Equatable {
  const ResetpasswordState();

  @override
  List<Object> get props => [];
}

final class ResetpasswordInitial extends ResetpasswordState {}

class ResetpasswordLoading extends ResetpasswordState {}

class ResetpasswordSuccess extends ResetpasswordState {
  final String msg;

  const ResetpasswordSuccess({required this.msg});

  @override
  List<Object> get props => [msg];
}

class ResetpasswordFailure extends ResetpasswordState {
  final String errorMessage;

  const ResetpasswordFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
