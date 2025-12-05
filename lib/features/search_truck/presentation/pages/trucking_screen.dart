import 'package:beauty_ride/core/functions/translate.dart';
import 'package:beauty_ride/features/search_truck/presentation/cubit/search_truck_cubit.dart';
import 'package:beauty_ride/features/search_truck/presentation/widgets/connecting_sercive.dart';
import 'package:beauty_ride/features/search_truck/presentation/widgets/pulsating_location_marker.dart';
import 'package:beauty_ride/features/search_truck/presentation/widgets/service_provider_card.dart';
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/cubits/location/location_cubit.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:beauty_ride/shared/widgets/give_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:svg_flutter/svg.dart';

class TruckingScreen extends StatefulWidget {
  const TruckingScreen({super.key});

  @override
  State<TruckingScreen> createState() => _TruckingScreenState();
}

class _TruckingScreenState extends State<TruckingScreen> {
  GoogleMapController? mapController;

  @override
  void dispose() {
    super.dispose();
    // SearchTruckCubit().completerController!.dispose();
  }

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
                            tr.onTheWay,
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
                Positioned(
                  bottom: 0,
                  child: Container(
                    // height: 230.h,
                    width: 390.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              tr.onTheWay,
                              style: AppTextStyle.textStyle(
                                appFontSize: 16.sp,
                                appFontWeight: FontWeight.w400,
                                color: Color(0xff110808),
                              ),
                            ),
                            Text(
                              "4 ${tr.minutes}",
                              style: AppTextStyle.textStyle(
                                cairo: true,
                                appFontSize: 15.sp,
                                appFontWeight: FontWeight.w400,
                                color: Color(0xff8A4242),
                              ),
                            ),
                          ],
                        ),
                        GiveSpace(height: 16),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffE4C6C6).withOpacity(0.60),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  ImagesResources.man,
                                  width: 34.w,
                                  height: 34.h,
                                ),
                              ),
                              GiveSpace(width: 9.w),
                              Column(
                                children: [
                                  Text(
                                    "احمد سالم",
                                    style: AppTextStyle.textStyle(
                                      appFontSize: 12.sp,
                                      appFontWeight: FontWeight.bold,
                                      color: Color(0xff110808),
                                    ),
                                  ),
                                  Row(
                                    spacing: 20.w,
                                    children: [
                                      Row(
                                        spacing: 5.w,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            "5.0",
                                            style: AppTextStyle.textStyle(
                                              cairo: true,
                                              appFontSize: 12.sp,
                                              appFontWeight: FontWeight.bold,
                                              color: Color(0xff110808),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '300 EGP',
                                        style: AppTextStyle.textStyle(
                                          cairo: true,
                                          appFontSize: 14.sp,
                                          appFontWeight: FontWeight.w400,
                                          color: Color(0xff110808),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                spacing: 20.w,
                                children: [
                                  ConnectingSercive(
                                    icon: IconsResources.message,
                                    onTap: () {},
                                  ),
                                  ConnectingSercive(
                                    icon: IconsResources.calling,
                                    onTap: () {},
                                  ),
                                  GiveSpace(width: 5.w),
                                ],
                              ),
                            ],
                          ),
                        ),
                        GiveSpace(height: 26),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: 32.w,
                            vertical: 16.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            border: Border.all(
                              color: Color(0xffC40000),
                              width: 1.w,
                            ),
                          ),
                          child: Text(
                            tr.cancelSearch,
                            style: AppTextStyle.textStyle(
                              appFontSize: 18.sp,
                              appFontWeight: FontWeight.w400,
                              color: Color(0xffC40000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



/*



  
*/