import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'qr_data_state.dart';

class QrDataCubit extends Cubit<QrDataState> {
  QrDataCubit() : super(QrDataInitial());
}
