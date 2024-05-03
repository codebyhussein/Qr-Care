part of 'scan_qr_cubit.dart';


abstract class ScanQrState extends Equatable {

  const ScanQrState();


  @override

  List<Object> get props => [];

}


class ScanQrInitial extends ScanQrState {

  @override

  List<Object> get props => [];

}


class ScanQrLoading extends ScanQrState {}


class ScanQrSuccess extends ScanQrState {

  final String qrData;


  const ScanQrSuccess(this.qrData);


  @override

  List<Object> get props => [qrData];

}


class ScanQrError extends ScanQrState {

  final String message;


  const ScanQrError(this.message);


  @override

  List<Object> get props => [message];

}

