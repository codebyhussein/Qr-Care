part of 'information_cubit.dart';


abstract class InformationState extends Equatable {

  const InformationState();


  @override

  List<Object> get props => [];

}


class InformationInitial extends InformationState {}


class InfoScreenLoading extends InformationState {}


class InfoScreenSuccess extends InformationState {}


class InfoScreenError extends InformationState {

  final String message;


  const InfoScreenError(this.message);


  @override

  List<Object> get props => [message];

}

