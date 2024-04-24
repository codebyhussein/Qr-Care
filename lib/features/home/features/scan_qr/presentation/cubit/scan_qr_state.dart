part of 'scan_qr_cubit.dart';


abstract class ScanQrState extends Equatable {

  const ScanQrState();


  @override

  List<Object> get props => [];

}


// Define the initial state class


class ScanQrInitial extends ScanQrState {

  @override

  List<Object> get props => [];

}


// Define loading state


class ScanQrLoading extends ScanQrState {}


class ScanQrSuccess extends ScanQrState {

  final String qrData;


  const ScanQrSuccess(this.qrData);


  @override

  List<Object> get props => [qrData];

}


// Define state when an error occurs while scanning QR code


class ScanQrError extends ScanQrState {

  final String message;


  const ScanQrError(this.message);


  @override

  List<Object> get props => [message];

}

