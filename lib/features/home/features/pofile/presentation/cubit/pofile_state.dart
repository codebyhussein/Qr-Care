part of 'pofile_cubit.dart';

abstract class PofileState extends Equatable {
  const PofileState();

  @override
  List<Object> get props => [];
}

class PofileInitial extends PofileState {}
class SuccessEditUser extends PofileState {}
class LoadingEditUser extends PofileState {}
class ErrorEditUser extends PofileState {
  final String error;

  const ErrorEditUser({required this.error});
}
