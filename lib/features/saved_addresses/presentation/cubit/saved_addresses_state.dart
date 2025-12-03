part of 'saved_addresses_cubit.dart';

abstract class SavedAddressesState extends Equatable {
  const SavedAddressesState();

  @override
  List<Object> get props => [];
}

class SavedAddressesInitial extends SavedAddressesState {}

class SavedAddressesLoaded extends SavedAddressesState {
  final List<SavedAddressModel> addresses;

  const SavedAddressesLoaded({required this.addresses});

  SavedAddressesLoaded copyWith({
    List<SavedAddressModel>? addresses,
  }) {
    return SavedAddressesLoaded(
      addresses: addresses ?? this.addresses,
    );
  }

  @override
  List<Object> get props => [addresses];
}
