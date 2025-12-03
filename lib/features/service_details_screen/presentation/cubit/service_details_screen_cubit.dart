import 'package:beauty_ride/core/functions/translate.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'service_details_screen_state.dart';

class ServiceDetailsScreenCubit extends Cubit<ServiceDetailsScreenState> {
  ServiceDetailsScreenCubit() : super(ServiceDetailsScreenInitial()) {
    loadInitialData();
  }

  void loadInitialData() {
    emit(
      ServiceDetailsScreenLoaded(
        additionalNotes: tr.allergicToHydrogenPeroxide,
      ),
    );
  }

  void updateHairLength(String? value) {
    if (state is ServiceDetailsScreenLoaded) {
      final currentState = state as ServiceDetailsScreenLoaded;
      emit(currentState.copyWith(selectedHairLength: value));
    }
  }

  void updateDyeType(String? value) {
    if (state is ServiceDetailsScreenLoaded) {
      final currentState = state as ServiceDetailsScreenLoaded;
      emit(currentState.copyWith(selectedDyeType: value));
    }
  }

  void updateDyeColor(String? value) {
    if (state is ServiceDetailsScreenLoaded) {
      final currentState = state as ServiceDetailsScreenLoaded;
      emit(currentState.copyWith(selectedDyeColor: value));
    }
  }

  void updateAdditionalNotes(String value) {
    if (state is ServiceDetailsScreenLoaded) {
      final currentState = state as ServiceDetailsScreenLoaded;
      emit(currentState.copyWith(additionalNotes: value));
    }
  }

  void submitForm() {
    // TODO: Submit form data
    // Navigate to next screen or submit data
  }
}
