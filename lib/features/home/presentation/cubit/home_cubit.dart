import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    loadHomeData();
  }

  void loadHomeData() {
    // TODO: Load data from repository/use case
    final services = [
      ServiceModel(id: '1', name: 'wax', icon: 'wax_icon'),
      ServiceModel(id: '2', name: 'massage', icon: 'massage_icon'),
      ServiceModel(id: '3', name: 'manicure', icon: 'manicure_icon'),
      ServiceModel(id: '4', name: 'skinCleansing', icon: 'skin_icon'),
      ServiceModel(id: '5', name: 'dye', icon: 'dye_icon'),
      ServiceModel(id: '6', name: 'spa', icon: 'spa_icon'),
      ServiceModel(id: '7', name: 'makeup', icon: 'makeup_icon'),
      ServiceModel(id: '8', name: 'haircut', icon: 'haircut_icon'),
    ];

    final mostRequestedServices = [
      MostRequestedService(
        id: '1',
        image: 'service1',
        discount: '50%',
        isFavorite: false,
      ),
      MostRequestedService(
        id: '2',
        image: 'service2',
        isFavorite: false,
      ),
    ];

    emit(HomeLoaded(
      services: services,
      mostRequestedServices: mostRequestedServices,
      location: 'القطامية',
      address: '42 شارع احمد سالم التجمع الاول',
    ));
  }

  void toggleFavorite(String serviceId) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final updatedServices = currentState.mostRequestedServices.map((service) {
        if (service.id == serviceId) {
          return MostRequestedService(
            id: service.id,
            image: service.image,
            discount: service.discount,
            isFavorite: !service.isFavorite,
          );
        }
        return service;
      }).toList();

      emit(HomeLoaded(
        services: currentState.services,
        mostRequestedServices: updatedServices,
        location: currentState.location,
        address: currentState.address,
      ));
    }
  }
}
