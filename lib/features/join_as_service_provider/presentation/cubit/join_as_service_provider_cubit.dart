import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'join_as_service_provider_state.dart';

class JoinAsServiceProviderCubit extends Cubit<JoinAsServiceProviderState> {
  JoinAsServiceProviderCubit() : super(JoinAsServiceProviderInitial());
}
