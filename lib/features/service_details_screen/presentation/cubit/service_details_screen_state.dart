part of 'service_details_screen_cubit.dart';

abstract class ServiceDetailsScreenState extends Equatable {
  const ServiceDetailsScreenState();

  @override
  List<Object> get props => [];
}

class ServiceDetailsScreenInitial extends ServiceDetailsScreenState {}

class ServiceDetailsScreenLoaded extends ServiceDetailsScreenState {
  final String? selectedHairLength;
  final String? selectedDyeType;
  final String? selectedDyeColor;
  final String additionalNotes;

  const ServiceDetailsScreenLoaded({
    this.selectedHairLength,
    this.selectedDyeType,
    this.selectedDyeColor,
    this.additionalNotes = '',
  });

  ServiceDetailsScreenLoaded copyWith({
    String? selectedHairLength,
    String? selectedDyeType,
    String? selectedDyeColor,
    String? additionalNotes,
  }) {
    return ServiceDetailsScreenLoaded(
      selectedHairLength: selectedHairLength ?? this.selectedHairLength,
      selectedDyeType: selectedDyeType ?? this.selectedDyeType,
      selectedDyeColor: selectedDyeColor ?? this.selectedDyeColor,
      additionalNotes: additionalNotes ?? this.additionalNotes,
    );
  }

  @override
  List<Object> get props => [
        selectedHairLength ?? '',
        selectedDyeType ?? '',
        selectedDyeColor ?? '',
        additionalNotes,
      ];
}
