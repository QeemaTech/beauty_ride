part of 'info_screen_cubit.dart';

abstract class InfoScreenState extends Equatable {
  const InfoScreenState();

  @override
  List<Object> get props => [];
}

class InfoScreenInitial extends InfoScreenState {}

class InfoScreenLoaded extends InfoScreenState {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String gender;
  final String? dateOfBirth;
  final String? profileImage;

  const InfoScreenLoaded({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    this.dateOfBirth,
    this.profileImage,
  });

  InfoScreenLoaded copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? gender,
    String? dateOfBirth,
    String? profileImage,
  }) {
    return InfoScreenLoaded(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        phone,
        gender,
        dateOfBirth ?? '',
        profileImage ?? '',
      ];
}

class InfoScreenSuccess extends InfoScreenState {}
