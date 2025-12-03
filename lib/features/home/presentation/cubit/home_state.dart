part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

// class HomeLoaded extends HomeState {
//   final List<ServiceModel> services;
//   final List<MostRequestedService> mostRequestedServices;
//   final String location;
//   final String address;

//   const HomeLoaded({
//     required this.services,
//     required this.mostRequestedServices,
//     required this.location,
//     required this.address,
//   });

//   @override
//   List<Object> get props => [services, mostRequestedServices, location, address];
// }

// class ServiceModel {
//   final String id;
//   final String name;
//   final String icon;

//   ServiceModel({
//     required this.id,
//     required this.name,
//     required this.icon,
//   });
// }

// class MostRequestedService {
//   final String id;
//   final String image;
//   final String? discount;
//   final bool isFavorite;

//   MostRequestedService({
//     required this.id,
//     required this.image,
//     this.discount,
//     this.isFavorite = false,
//   });
// }
