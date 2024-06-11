part of 'pofile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class PofileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {

}

class ProfileError extends ProfileState {
  final String errorMessage;

  const ProfileError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


