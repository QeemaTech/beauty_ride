part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class ShowPassword extends AuthState {
  final bool value;

  const ShowPassword({required this.value});
    @override
  List<Object> get props => [value];

}
class ShowPasswordSignUP extends AuthState {
  final bool value;

  const ShowPasswordSignUP({required this.value});
    @override
  List<Object> get props => [value];

}
class ShowConfirmPassword extends AuthState {
  final bool value;

  const ShowConfirmPassword({required this.value});
    @override
  List<Object> get props => [value];

}
class SelectMaleOrFimale extends AuthState {
  final bool value;

  const SelectMaleOrFimale({required this.value});
    @override
  List<Object> get props => [value];

}
