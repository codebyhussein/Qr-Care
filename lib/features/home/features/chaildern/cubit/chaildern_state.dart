part of 'chaildern_cubit.dart';

abstract class ChaildernState extends Equatable {
  const ChaildernState();

  @override
  List<Object> get props => [];
}

class ChaildernInitial extends ChaildernState {}

class LoadingAddChild extends ChaildernState {}

class SuccessAddChild extends ChaildernState {}

class ErrorAddChild extends ChaildernState {
  final String error;

  const ErrorAddChild({required this.error});
}

class SuccessSelectChildImage extends ChaildernState {}

class SuccessSelectIdImage extends ChaildernState {}
