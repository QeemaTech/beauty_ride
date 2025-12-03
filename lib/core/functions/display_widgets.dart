import 'package:beauty_ride/features/customer_service/presentation/pages/customer_service_screen.dart';
import 'package:beauty_ride/features/electronic_Wallet/presentation/pages/electronic_wallet_screen.dart';
import 'package:beauty_ride/features/home/presentation/pages/home_screen.dart';
import 'package:beauty_ride/features/info_screen/presentation/pages/info_screen.dart';
import 'package:beauty_ride/features/insurance_cards/presentation/pages/insurance_cards_screen.dart';
import 'package:beauty_ride/features/join_as_service_provider/presentation/pages/join_as_service_provider_screen.dart';
import 'package:beauty_ride/features/language/presentation/pages/language_screen.dart';
import 'package:beauty_ride/features/myBookings/presentation/pages/my_bookings_screen.dart';
import 'package:beauty_ride/features/saved_addresses/presentation/pages/savedAddresses_screen.dart';
import 'package:flutter/material.dart';

Widget displayWidgets(int index) {
  switch (index) {
    case 0:
      return HomeScreen();
    case 1:
      return InfoScreen();
    case 2:
      return MyBookingsScreen ();
    case 3:
      return ElectronicWalletScreen ();
    case 4:
      return InsuranceCardsScreen ();
    case 5:
      return SavedaddressesScreen ();
    case 6:
      return JoinAsServiceProviderScreen ();
    case 7:
      return LanguageScreen ();
    case 8:
      return CustomerServiceScreen();

    default:
      return HomeScreen();
  }
}
