import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/auth/presentation/pages/login_screen.dart';
import 'package:beauty_ride/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:beauty_ride/features/customer_service/presentation/pages/customer_service_screen.dart';
import 'package:beauty_ride/features/dashboard/screens/dashboard_screen.dart';
import 'package:beauty_ride/features/electronic_Wallet/presentation/pages/electronic_wallet_screen.dart';
import 'package:beauty_ride/features/home/presentation/pages/home_screen.dart';
import 'package:beauty_ride/features/info_screen/presentation/pages/info_screen.dart';
import 'package:beauty_ride/features/insurance_cards/presentation/pages/insurance_cards_screen.dart';
import 'package:beauty_ride/features/join_as_service_provider/presentation/pages/join_as_service_provider_screen.dart';
import 'package:beauty_ride/features/language/presentation/pages/language_screen.dart';
import 'package:beauty_ride/features/myBookings/presentation/pages/my_bookings_screen.dart';
import 'package:beauty_ride/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:beauty_ride/features/on_boarding/pages/on_boarding_screen.dart';
import 'package:beauty_ride/features/saved_addresses/presentation/pages/savedAddresses_screen.dart';
import 'package:beauty_ride/features/search/presentation/pages/search_screen.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/pages/service_details_screen.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/pages/service_details_screen_part2.dart';
import 'package:beauty_ride/features/service_screen/presentation/pages/service_screen.dart';
import 'package:beauty_ride/features/splash/presentation/pages/splash_onboard.dart';
import 'package:beauty_ride/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final isIos = defaultTargetPlatform == TargetPlatform.iOS;
    final nameRoute = settings.name;
    final arg = settings.arguments;

    switch (nameRoute) {
      case Routes.splash:
        return _buildRoute(const SplashScreen(), isIos);
      case Routes.splashOnbording:
        return _buildRoute(const SplashOnboard(), isIos);
      case Routes.onboard:
        return _buildRoute(const OnBoardingScreen(), isIos);
      case Routes.home:
        return _buildRoute(const HomeScreen(), isIos);
      case Routes.login:
        return _buildRoute(const LoginScreen(), isIos);
      case Routes.signUp:
        return _buildRoute(const SignUpScreen(), isIos);
      case Routes.dashboard:
        return _buildRoute(DashboardScreen(), isIos);
      case Routes.serviceScreen:
        return _buildRoute(ServiceScreen(), isIos);
      case Routes.searchScreen:
        return _buildRoute(SearchScreen(), isIos);
      case Routes.serviceDetailsScreen:
        return _buildRoute(ServiceDetailsScreen(), isIos);
      case Routes.serviceDetailsScreenPart2:
        return _buildRoute(ServiceDetailsScreenPart2(), isIos);
      case Routes.infoScreen:
        return _buildRoute(InfoScreen(), isIos);
      case Routes.myBookingsScreen:
        return _buildRoute(MyBookingsScreen(), isIos);
      case Routes.electronicWalletScreen:
        return _buildRoute(ElectronicWalletScreen(), isIos);
      case Routes.insuranceCardsScreen:
        return _buildRoute(InsuranceCardsScreen(), isIos);
      case Routes.savedaddressesScreen:
        return _buildRoute(SavedaddressesScreen(), isIos);
      case Routes.joinAsServiceProviderScreen:
        return _buildRoute(JoinAsServiceProviderScreen(), isIos);
      case Routes.language:
        return _buildRoute(LanguageScreen(), isIos);
      case Routes.customerServiceScreen:
        return _buildRoute(CustomerServiceScreen(), isIos);
      case Routes.notifications:
        return _buildRoute(NotificationsScreen(), isIos);

      default:
        return _buildRoute(_undefinedWidget(), isIos);
    }
  }

  //* customize to android or ios
  static Route<dynamic> _buildRoute(Widget page, bool isIos) {
    if (isIos) {
      return CupertinoPageRoute(builder: (_) => page);
    } else {
      return MaterialPageRoute(builder: (_) => page);
    }
  }

  //* when not found page display this
  static Widget _undefinedWidget() {
    return Scaffold(
      appBar: AppBar(title: const Text("undefined")),
      body: const Center(child: Text("no page here")),
    );
  }
}
