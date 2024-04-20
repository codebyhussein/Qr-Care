part of 'register_cubit.dart';


abstract class RegisterState extends Equatable {

  const RegisterState();


  @override

  List<Object> get props => [];

}


class RegisterInitial extends RegisterState {}


class RegisterLoading extends RegisterState {}


class RegisterSuccess extends RegisterState {

  UserEntity user;


  RegisterSuccess(this.user);


  @override

  List<Object> get props => [user];

}


class RegisterFailure extends RegisterState {

  final String errorMessage;


  const RegisterFailure({required this.errorMessage});


  @override

  List<Object> get props => [errorMessage];

}

