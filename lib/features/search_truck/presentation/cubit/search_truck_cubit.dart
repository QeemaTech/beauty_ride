import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:beauty_ride/features/search_truck/data/models/service_provider_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'search_truck_state.dart';

class SearchTruckCubit extends Cubit<SearchTruckState> {
  SearchTruckCubit({Position? savedPosition}) : super(SearchTruckInitial());
  CameraPosition? cameraPosition;
  GoogleMapController? completerController;
  Completer<GoogleMapController>? completer;

  List<Marker> markers = [];
  Position? currentPosition;
  LatLng? selectedLocation;
  List<ServiceProviderModel> serviceProviders = [];

  getCurrentPositions(double lat, double lng) {
    // Clear existing markers before adding new one
    markers.clear();
    cameraPosition = CameraPosition(target: LatLng(lat, lng), zoom: 15.0);
    markers.add(
      Marker(
        markerId: const MarkerId("current"),
        position: LatLng(lat, lng),
      ),
    );
    emit(SearchTruckInitial());
  }

  void selectLocation(LatLng location) {
    // Clear existing markers
    markers.clear();
    // Update camera position
    cameraPosition = CameraPosition(
      target: location,
      zoom: 15.0,
    );
    // Add selected location marker
    markers.add(
      Marker(
        markerId: const MarkerId("selected"),
        position: location,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
    selectedLocation = location;
    // Load service providers for the selected location
    loadServiceProviders(location);
    emit(SearchTruckInitial());
  }

  void loadServiceProviders(LatLng location) {
    // TODO: Replace with actual API call
    // For now, using mock data
    serviceProviders = [
      ServiceProviderModel(
        id: '1',
        name: 'احمد سالم',
        rating: 5.0,
        imageUrl: '',
        price: 300.0,
        latitude: location.latitude + 0.001,
        longitude: location.longitude + 0.001,
      ),
      ServiceProviderModel(
        id: '2',
        name: 'محمد علي',
        rating: 4.8,
        imageUrl: '',
        price: 280.0,
        latitude: location.latitude - 0.001,
        longitude: location.longitude + 0.001,
      ),
      ServiceProviderModel(
        id: '3',
        name: 'سارة أحمد',
        rating: 4.9,
        imageUrl: '',
        price: 320.0,
        latitude: location.latitude + 0.001,
        longitude: location.longitude - 0.001,
      ),
    ];
    emit(SearchTruckLocationLoaded());
  }

  void acceptProvider(String providerId) {
    // TODO: Implement accept provider logic
    debugPrint('Accepting provider: $providerId');
    // Remove accepted provider from list
    serviceProviders.removeWhere((provider) => provider.id == providerId);
    emit(SearchTruckLocationLoaded());
  }

  void rejectProvider(String providerId) {
    // TODO: Implement reject provider logic
    debugPrint('Rejecting provider: $providerId');
    // Remove rejected provider from list
    serviceProviders.removeWhere((provider) => provider.id == providerId);
    emit(SearchTruckLocationLoaded());
  }

  Future<bool> _handleLocationPermission(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location services are disabled. Please enable the services',
          ),
        ),
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')),
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location permissions are permanently denied, we cannot request permissions.',
          ),
        ),
      );
      return false;
    }
    if (permission == LocationPermission.whileInUse) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location permissions are granted while in use. We recommend enabling background location services.',
          ),
        ),
      );

      return true;
    }
    return true;
  }

  Future<void> getCurrentPosition(context) async {
    final hasPermission = await _handleLocationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
          currentPosition = position;
        })
        .catchError((e) {
          debugPrint(e);
        });
  }
}
