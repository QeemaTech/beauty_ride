import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mybookings_state.dart';

class MybookingsCubit extends Cubit<MybookingsState> {
  MybookingsCubit() : super(MybookingsInitial());
}
