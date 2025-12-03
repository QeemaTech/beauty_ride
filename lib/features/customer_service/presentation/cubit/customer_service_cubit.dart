import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'customer_service_state.dart';

class CustomerServiceCubit extends Cubit<CustomerServiceState> {
  CustomerServiceCubit() : super(CustomerServiceInitial()) {
    loadInitialData();
  }

  void loadInitialData() {
    emit(CustomerServiceLoaded(
      name: '',
      email: '',
      phone: '',
      message: '',
    ));
  }

  void updateName(String name) {
    if (state is CustomerServiceLoaded) {
      final currentState = state as CustomerServiceLoaded;
      emit(currentState.copyWith(name: name));
    }
  }

  void updateEmail(String email) {
    if (state is CustomerServiceLoaded) {
      final currentState = state as CustomerServiceLoaded;
      emit(currentState.copyWith(email: email));
    }
  }

  void updatePhone(String phone) {
    if (state is CustomerServiceLoaded) {
      final currentState = state as CustomerServiceLoaded;
      emit(currentState.copyWith(phone: phone));
    }
  }

  void updateMessage(String message) {
    if (state is CustomerServiceLoaded) {
      final currentState = state as CustomerServiceLoaded;
      emit(currentState.copyWith(message: message));
    }
  }

  void submitForm() {
    if (state is CustomerServiceLoaded) {
      final currentState = state as CustomerServiceLoaded;
      // TODO: Submit form to API
      // Validate and submit
      if (currentState.name.isNotEmpty &&
          currentState.email.isNotEmpty &&
          currentState.phone.isNotEmpty &&
          currentState.message.isNotEmpty) {
        emit(CustomerServiceSuccess());
        // Reset after success
        Future.delayed(Duration(seconds: 2), () {
          loadInitialData();
        });
      }
    }
  }
}
