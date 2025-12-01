import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool value = false;
  bool passSignUP = false;
  bool passConfirmSignUP = false;

  bool radio = false;

  void selectMaleOrFimale(){
    radio = !radio;
    emit(SelectMaleOrFimale(value: radio));
  }

  void showPasswordLogin() {
    value = !value;
    emit(ShowPassword(value: value));
  }
  void showPasswordSignUP() {
    passSignUP = !passSignUP;
    emit(ShowPasswordSignUP(value: passSignUP));
  }
  void showConfirmPasswordSignUP() {
    passConfirmSignUP = !passConfirmSignUP;
    emit(ShowConfirmPassword(value: passConfirmSignUP));
  }
}
