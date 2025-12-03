part of 'customer_service_cubit.dart';

abstract class CustomerServiceState extends Equatable {
  const CustomerServiceState();

  @override
  List<Object> get props => [];
}

class CustomerServiceInitial extends CustomerServiceState {}

class CustomerServiceLoaded extends CustomerServiceState {
  final String name;
  final String email;
  final String phone;
  final String message;

  const CustomerServiceLoaded({
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
  });

  CustomerServiceLoaded copyWith({
    String? name,
    String? email,
    String? phone,
    String? message,
  }) {
    return CustomerServiceLoaded(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [name, email, phone, message];
}

class CustomerServiceSuccess extends CustomerServiceState {}
