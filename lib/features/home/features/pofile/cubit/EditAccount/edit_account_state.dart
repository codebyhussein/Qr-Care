part of 'edit_account_cubit.dart';

@immutable
abstract class EditAccountState {}

class EditAccountInitial extends EditAccountState {}
class EditAccountLoading extends EditAccountState {}
class EditAccountSuccess extends EditAccountState {}
class EditAccountError extends EditAccountState {
  final String error;

  EditAccountError({required this.error});
}
class SuccessEditUser extends EditAccountState {}
class LoadingEditUser extends EditAccountState {}
class ErrorEditUser extends EditAccountState {
  final String error;

  ErrorEditUser({required this.error});
}