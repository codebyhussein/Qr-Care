import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pofile_state.dart';

class PofileCubit extends Cubit<PofileState> {
  PofileCubit() : super(PofileInitial());
}
