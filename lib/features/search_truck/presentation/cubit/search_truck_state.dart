part of 'search_truck_cubit.dart';

abstract class SearchTruckState extends Equatable {
  const SearchTruckState();

  @override
  List<Object> get props => [];
}

class SearchTruckInitial extends SearchTruckState {}

class SearchTruckLocationLoaded extends SearchTruckState {
  final List<ServiceProviderModel> providers;

  const SearchTruckLocationLoaded({this.providers = const []});

  @override
  List<Object> get props => [providers];
}
