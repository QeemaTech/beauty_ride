import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'service_screen_state.dart';

class ServiceScreenCubit extends Cubit<ServiceScreenState> {
  ServiceScreenCubit() : super(ServiceScreenInitial());
}
