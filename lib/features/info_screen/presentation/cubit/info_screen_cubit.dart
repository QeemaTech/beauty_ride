import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'info_screen_state.dart';

class InfoScreenCubit extends Cubit<InfoScreenState> {
  InfoScreenCubit() : super(InfoScreenInitial()) {
    loadUserData();
  }

  void loadUserData() {
    // TODO: Load from repository/API
    emit(InfoScreenLoaded(
      firstName: 'هبه',
      lastName: 'ياسر',
      email: 'heba.yasser@example.com',
      phone: '+20 123 456 7890',
      gender: 'female',
      dateOfBirth: '1995-05-15',
      profileImage: null,
    ));
  }

  void updateFirstName(String firstName) {
    if (state is InfoScreenLoaded) {
      final currentState = state as InfoScreenLoaded;
      emit(currentState.copyWith(firstName: firstName));
    }
  }

  void updateLastName(String lastName) {
    if (state is InfoScreenLoaded) {
      final currentState = state as InfoScreenLoaded;
      emit(currentState.copyWith(lastName: lastName));
    }
  }

  void updateEmail(String email) {
    if (state is InfoScreenLoaded) {
      final currentState = state as InfoScreenLoaded;
      emit(currentState.copyWith(email: email));
    }
  }

  void updatePhone(String phone) {
    if (state is InfoScreenLoaded) {
      final currentState = state as InfoScreenLoaded;
      emit(currentState.copyWith(phone: phone));
    }
  }

  void updateGender(String gender) {
    if (state is InfoScreenLoaded) {
      final currentState = state as InfoScreenLoaded;
      emit(currentState.copyWith(gender: gender));
    }
  }

  void updateDateOfBirth(String dateOfBirth) {
    if (state is InfoScreenLoaded) {
      final currentState = state as InfoScreenLoaded;
      emit(currentState.copyWith(dateOfBirth: dateOfBirth));
    }
  }

  void updateProfileImage(String? imagePath) {
    if (state is InfoScreenLoaded) {
      final currentState = state as InfoScreenLoaded;
      emit(currentState.copyWith(profileImage: imagePath));
    }
  }

  void saveUserData() {
    if (state is InfoScreenLoaded) {
      // TODO: Save to repository/API
      emit(InfoScreenSuccess());
      // Reload after success
      Future.delayed(Duration(seconds: 2), () {
        loadUserData();
      });
    }
  }
}
