part of 'service_details_screen_part2_cubit.dart';

abstract class ServiceDetailsScreenPart2State extends Equatable {
  const ServiceDetailsScreenPart2State();

  @override
  List<Object> get props => [];
}

class ServiceDetailsScreenPart2Initial extends ServiceDetailsScreenPart2State {}

class ServiceDetailsScreenPart2Loaded extends ServiceDetailsScreenPart2State {
  final List<SelectedService> selectedServices;
  final int numberOfServiceSeekers;
  final double? offeredPrice;
  final double recommendedPrice;
  final String paymentMethod;
  final String? discountCode;
  final String location;
  final String address;

  const ServiceDetailsScreenPart2Loaded({
    required this.selectedServices,
    this.numberOfServiceSeekers = 1,
    this.offeredPrice,
    this.recommendedPrice = 540.0,
    this.paymentMethod = 'cash',
    this.discountCode,
    required this.location,
    required this.address,
  });

  ServiceDetailsScreenPart2Loaded copyWith({
    List<SelectedService>? selectedServices,
    int? numberOfServiceSeekers,
    double? offeredPrice,
    double? recommendedPrice,
    String? paymentMethod,
    String? discountCode,
    String? location,
    String? address,
  }) {
    return ServiceDetailsScreenPart2Loaded(
      selectedServices: selectedServices ?? this.selectedServices,
      numberOfServiceSeekers: numberOfServiceSeekers ?? this.numberOfServiceSeekers,
      offeredPrice: offeredPrice ?? this.offeredPrice,
      recommendedPrice: recommendedPrice ?? this.recommendedPrice,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      discountCode: discountCode ?? this.discountCode,
      location: location ?? this.location,
      address: address ?? this.address,
    );
  }

  @override
  List<Object> get props => [
        selectedServices,
        numberOfServiceSeekers,
        offeredPrice ?? 0,
        recommendedPrice,
        paymentMethod,
        discountCode ?? '',
        location,
        address,
      ];
}

class SelectedService {
  final String id;
  final String name;
  final String icon;

  SelectedService({
    required this.id,
    required this.name,
    required this.icon,
  });
}
