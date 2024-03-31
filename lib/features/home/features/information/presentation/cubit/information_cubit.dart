import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'information_state.dart';

class InformationCubit extends Cubit<InformationState> {
  InformationCubit() : super(InformationInitial());
}
