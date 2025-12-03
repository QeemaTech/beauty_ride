import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'service_details_screen_part2_state.dart';

class ServiceDetailsScreenPart2Cubit extends Cubit<ServiceDetailsScreenPart2State> {
  ServiceDetailsScreenPart2Cubit() : super(ServiceDetailsScreenPart2Initial()) {
    loadInitialData();
  }

  

  void loadInitialData() {
    emit(ServiceDetailsScreenPart2Loaded(
      selectedServices: [
        SelectedService(
          id: '1',
          name: 'haircut',
          icon: IconsResources.cutHair,
        ),
      ],
      numberOfServiceSeekers: 3,
      offeredPrice: 300.0,
      recommendedPrice: 540.0,
      paymentMethod: 'cash',
      location: 'المنزل',
      address: '4 شارع احمد سالم القطامية - التجمع الأول',
    ));
  }

  void addService(SelectedService service) {
    if (state is ServiceDetailsScreenPart2Loaded) {
      final currentState = state as ServiceDetailsScreenPart2Loaded;
      final updatedServices = List<SelectedService>.from(currentState.selectedServices)
        ..add(service);
      emit(currentState.copyWith(selectedServices: updatedServices));
    }
  }

  void removeService(String serviceId) {
    if (state is ServiceDetailsScreenPart2Loaded) {
      final currentState = state as ServiceDetailsScreenPart2Loaded;
      final updatedServices = currentState.selectedServices
          .where((service) => service.id != serviceId)
          .toList();
      emit(currentState.copyWith(selectedServices: updatedServices));
    }
  }

  void updateNumberOfServiceSeekers(int count) {
    if (state is ServiceDetailsScreenPart2Loaded) {
      final currentState = state as ServiceDetailsScreenPart2Loaded;
      emit(currentState.copyWith(numberOfServiceSeekers: count));
    }
  }

  void updateOfferedPrice(double? price) {
    if (state is ServiceDetailsScreenPart2Loaded) {
      final currentState = state as ServiceDetailsScreenPart2Loaded;
      emit(currentState.copyWith(offeredPrice: price));
    }
  }

  void updatePaymentMethod(String method) {
    if (state is ServiceDetailsScreenPart2Loaded) {
      final currentState = state as ServiceDetailsScreenPart2Loaded;
      emit(currentState.copyWith(paymentMethod: method));
    }
  }

  void updateDiscountCode(String? code) {
    if (state is ServiceDetailsScreenPart2Loaded) {
      final currentState = state as ServiceDetailsScreenPart2Loaded;
      emit(currentState.copyWith(discountCode: code));
    }
  }

  void activateDiscountCode(String code) {
    // TODO: Validate and activate discount code
    updateDiscountCode(code);
  }
}
