import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_addresses_state.dart';

class SavedAddressModel {
  final String id;
  final String title;
  final String address;
  final String? buildingNumber;
  final String? floor;
  final String? apartment;
  final bool isDefault;

  SavedAddressModel({
    required this.id,
    required this.title,
    required this.address,
    this.buildingNumber,
    this.floor,
    this.apartment,
    this.isDefault = false,
  });
}

class SavedAddressesCubit extends Cubit<SavedAddressesState> {
  SavedAddressesCubit() : super(SavedAddressesInitial()) {
    loadAddresses();
  }

  void loadAddresses() {
    // TODO: Load from repository/API
    final addresses = [
      SavedAddressModel(
        id: '1',
        title: 'المنزل',
        address: '4 شارع احمد سالم القطامية - التجمع الأول',
        buildingNumber: '4',
        floor: '3',
        apartment: '12',
        isDefault: true,
      ),
      SavedAddressModel(
        id: '2',
        title: 'العمل',
        address: '42 شارع احمد سالم التجمع الاول',
        buildingNumber: '42',
        floor: '5',
        apartment: '20',
        isDefault: false,
      ),
    ];

    emit(SavedAddressesLoaded(addresses: addresses));
  }

  void addAddress(SavedAddressModel address) {
    if (state is SavedAddressesLoaded) {
      final currentState = state as SavedAddressesLoaded;
      final updatedAddresses = List<SavedAddressModel>.from(currentState.addresses)
        ..add(address);
      emit(currentState.copyWith(addresses: updatedAddresses));
    }
  }

  void updateAddress(String id, SavedAddressModel updatedAddress) {
    if (state is SavedAddressesLoaded) {
      final currentState = state as SavedAddressesLoaded;
      final updatedAddresses = currentState.addresses.map((address) {
        if (address.id == id) {
          return updatedAddress;
        }
        return address;
      }).toList();
      emit(currentState.copyWith(addresses: updatedAddresses));
    }
  }

  void deleteAddress(String id) {
    if (state is SavedAddressesLoaded) {
      final currentState = state as SavedAddressesLoaded;
      final updatedAddresses = currentState.addresses
          .where((address) => address.id != id)
          .toList();
      emit(currentState.copyWith(addresses: updatedAddresses));
    }
  }

  void setDefaultAddress(String id) {
    if (state is SavedAddressesLoaded) {
      final currentState = state as SavedAddressesLoaded;
      final updatedAddresses = currentState.addresses.map((address) {
        return SavedAddressModel(
          id: address.id,
          title: address.title,
          address: address.address,
          buildingNumber: address.buildingNumber,
          floor: address.floor,
          apartment: address.apartment,
          isDefault: address.id == id,
        );
      }).toList();
      emit(currentState.copyWith(addresses: updatedAddresses));
    }
  }
}
