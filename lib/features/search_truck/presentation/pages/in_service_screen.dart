import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/search_truck/presentation/cubit/search_truck_cubit.dart';
import 'package:beauty_ride/features/search_truck/presentation/widgets/cancel_button.dart';
import 'package:beauty_ride/features/search_truck/presentation/widgets/pulsating_location_marker.dart';
import 'package:beauty_ride/features/search_truck/presentation/widgets/service_provider_card.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/cubits/location/location_cubit.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:svg_flutter/svg.dart';

class InServiceScreen extends StatefulWidget {
  const InServiceScreen({super.key});

  @override
  State<InServiceScreen> createState() => _InServiceScreenState();
}

class _InServiceScreenState extends State<InServiceScreen> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    // Get saved location from LocationCubit
    final locationCubit = context.read<LocationCubit>();
    final savedPosition = locationCubit.position;

    return BlocProvider(
      create: (context) {
        final cubit = SearchTruckCubit(savedPosition: savedPosition);
        // Use saved position if available
        if (savedPosition != null) {
          cubit.currentPosition = savedPosition;
          cubit.getCurrentPositions(
            savedPosition.latitude,
            savedPosition.longitude,
          );
        } else {
          // Initialize with default position (Cairo, Egypt)
          cubit.cameraPosition = const CameraPosition(
            target: LatLng(30.0444, 31.2357),
            zoom: 12.0,
          );
        }
        return cubit;
      },
      child: BlocBuilder<SearchTruckCubit, SearchTruckState>(
        builder: (context, state) {
          final cubit = context.read<SearchTruckCubit>();
          return Scaffold(
            body: Stack(
              clipBehavior: Clip.none,
              //alignment: Alignment.center,
              children: [
                BlocBuilder<SearchTruckCubit, SearchTruckState>(
                  builder: (context, state) {
                    final cubit = context.read<SearchTruckCubit>();

                    // Ensure camera position is set
                    final cameraPos =
                        cubit.cameraPosition ??
                        const CameraPosition(
                          target: LatLng(30.0444, 31.2357),
                          zoom: 12.0,
                        );

                    return GoogleMap(
                      mapType: MapType.normal,
                      markers: cubit.markers.toSet(),
                      initialCameraPosition: cameraPos,
                      myLocationEnabled: false,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      mapToolbarEnabled: false,
                      onTap: (LatLng latLng) {
                        // Use cubit method to select location
                        cubit.selectLocation(latLng);
                        // Animate camera to selected location
                        if (mapController != null) {
                          mapController!.animateCamera(
                            CameraUpdate.newLatLngZoom(latLng, 15.0),
                          );
                        }
                      },
                      onMapCreated: (controllerGoogle) {
                        try {
                          mapController = controllerGoogle;
                          //MyRiderCubit.instance.completer!.complete(controllerGoogle);
                          setState(() {
                            controllerGoogle.setMapStyle('''
          [
        {
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#f5f5f5"
            }
          ]
        },
        {
          "elementType": "labels.icon",
          "stylers": [
            {
              "visibility": "off"
            }
          ]
        },
        {
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "color": "#616161"
            }
          ]
        },
        {
          "elementType": "labels.text.stroke",
          "stylers": [
            {
              "color": "#f5f5f5"
            }
          ]
        },
        {
          "featureType": "administrative.land_parcel",
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "color": "#bdbdbd"
            }
          ]
        },
        {
          "featureType": "poi",
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#eeeeee"
            }
          ]
        },
        {
          "featureType": "poi",
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "color": "#757575"
            }
          ]
        },
        {
          "featureType": "poi.park",
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#e5e5e5"
            }
          ]
        },
        {
          "featureType": "poi.park",
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "color": "#9e9e9e"
            }
          ]
        },
        {
          "featureType": "road",
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#ffffff"
            }
          ]
        },
        {
          "featureType": "road.arterial",
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "color": "#757575"
            }
          ]
        },
        {
          "featureType": "road.highway",
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#dadada"
            }
          ]
        },
        {
          "featureType": "road.highway",
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "color": "#616161"
            }
          ]
        },
        {
          "featureType": "road.local",
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "color": "#9e9e9e"
            }
          ]
        },
        {
          "featureType": "transit.line",
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#e5e5e5"
            }
          ]
        },
        {
          "featureType": "transit.station",
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#eeeeee"
            }
          ]
        },
        {
          "featureType": "water",
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#c9c9c9"
            }
          ]
        },
        {
          "featureType": "water",
          "elementType": "labels.text.fill",
          "stylers": [
            {
              "color": "#9e9e9e"
            }
          ]
        }
      ]
          ''');
                          });

                          // After map is created, animate to current position if available
                          if (cubit.currentPosition != null) {
                            final newPosition = CameraPosition(
                              target: LatLng(
                                cubit.currentPosition!.latitude,
                                cubit.currentPosition!.longitude,
                              ),
                              zoom: 15.0,
                            );
                            controllerGoogle.animateCamera(
                              CameraUpdate.newCameraPosition(newPosition),
                            );
                          } else if (cubit.cameraPosition != null) {
                            controllerGoogle.animateCamera(
                              CameraUpdate.newCameraPosition(
                                cubit.cameraPosition!,
                              ),
                            );
                          }
                        } catch (e) {
                          debugPrint('Error setting map style: $e');
                        }
                      },
                    );
                  },
                ),

                // Pulsating Location Marker - only show when we have current position and no selected marker
                BlocBuilder<SearchTruckCubit, SearchTruckState>(
                  builder: (context, state) {
                    final cubit = context.read<SearchTruckCubit>();

                    // Show pulsating marker only when we have current position and no selected marker
                    final hasSelectedMarker = cubit.markers.any(
                      (marker) => marker.markerId.value == "selected",
                    );

                    if (cubit.currentPosition == null || hasSelectedMarker) {
                      return const SizedBox.shrink();
                    }

                    // Since camera is centered on current location, marker should be in center
                    return Positioned.fill(
                      child: IgnorePointer(
                        child: Center(
                          child: Transform.translate(
                            offset: Offset(
                              0,
                              -20.h,
                            ), // Adjust position slightly up
                            child: const PulsatingLocationMarker(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // AppBar overlay
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              child: SvgPicture.asset(
                                IconsResources.arrowRight,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                          Text(
                            tr.startSearch,
                            style: AppTextStyle.textStyle(
                              appFontSize: 18.sp,
                              appFontWeight: FontWeight.w400,
                              color: Color(0xff8A4242),
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ),
                ),
                // Service Providers List - shown when location is selected
                BlocBuilder<SearchTruckCubit, SearchTruckState>(
                  builder: (context, state) {
                    final cubit = context.read<SearchTruckCubit>();

                    // Show list only when there are service providers
                    if (cubit.serviceProviders.isEmpty) {
                      // Show cancel button when no providers
                      return Positioned(
                        bottom: 20,
                        child: CancelButton(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return Container(
                                  padding: EdgeInsets.only(
                                    right: 20.w,
                                    left: 20.w,
                                    top: 24.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Color(0xffFFFFFF),
                                  ),
                                  child: Column(children: []),
                                );
                              },
                            );
                          },
                        ),
                      );
                    }

                    // Show providers list
                    return Positioned.fill(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.transparent,
                        child: ListView.builder(
                          shrinkWrap: true,
                          //padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemCount: cubit.serviceProviders.length,
                          itemBuilder: (context, index) {
                            final provider = cubit.serviceProviders[index];
                            return ServiceProviderCard(
                              provider: provider,
                              onAccept: () {
                                cubit.acceptProvider(provider.id);
                                context.pushNamed(Routes.truckingScreen);
                              },
                              onReject: () {
                                cubit.rejectProvider(provider.id);
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
