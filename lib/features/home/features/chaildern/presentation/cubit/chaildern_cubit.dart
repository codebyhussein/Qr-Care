import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chaildern_state.dart';

class ChaildernCubit extends Cubit<ChaildernState> {
  ChaildernCubit() : super(ChaildernInitial());
}
