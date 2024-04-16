part of 'verificationpassword_cubit.dart';


sealed class VerificationpasswordState extends Equatable {

  const VerificationpasswordState();


  @override

  List<Object> get props => [];

}


final class VerificationpasswordInitial extends VerificationpasswordState {}


class VerificationpasswordLoading extends VerificationpasswordState {}


class VerificationpasswordSuccess extends VerificationpasswordState {

  final String msg;


  const VerificationpasswordSuccess({required this.msg});


  @override

  List<Object> get props => [msg];

}


class VerificationpasswordFailure extends VerificationpasswordState {

  final String errorMessage;


  const VerificationpasswordFailure({required this.errorMessage});


  @override

  List<Object> get props => [errorMessage];

}

