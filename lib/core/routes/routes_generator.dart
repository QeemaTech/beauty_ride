import 'package:beauty_ride/app/my_app.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/auth/presentation/pages/login_screen.dart';
import 'package:beauty_ride/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:beauty_ride/features/customer_service/presentation/pages/customer_service_screen.dart';
import 'package:beauty_ride/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:beauty_ride/features/dashboard/screens/dashboard_screen.dart';
import 'package:beauty_ride/features/electronic_Wallet/presentation/pages/electronic_wallet_screen.dart';
import 'package:beauty_ride/features/home/presentation/pages/home_screen.dart';
import 'package:beauty_ride/features/info_screen/presentation/pages/info_screen.dart';
import 'package:beauty_ride/features/insurance_cards/presentation/pages/insurance_cards_screen.dart';
import 'package:beauty_ride/features/join_as_service_provider/presentation/pages/join_as_service_provider_screen.dart';
import 'package:beauty_ride/features/language/presentation/pages/language_screen.dart';
import 'package:beauty_ride/features/myBookings/presentation/pages/booking_screen.dart';
import 'package:beauty_ride/features/myBookings/presentation/pages/my_bookings_screen.dart';
import 'package:beauty_ride/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:beauty_ride/features/on_boarding/pages/on_boarding_screen.dart';
import 'package:beauty_ride/features/saved_addresses/presentation/pages/savedAddresses_screen.dart';
import 'package:beauty_ride/features/search/presentation/pages/search_screen.dart';
import 'package:beauty_ride/features/search_truck/presentation/pages/in_service_screen.dart';
import 'package:beauty_ride/features/search_truck/presentation/pages/search_truck_screen.dart';
import 'package:beauty_ride/features/search_truck/presentation/pages/trucking_screen.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/pages/service_details_screen.dart';
import 'package:beauty_ride/features/service_details_screen/presentation/pages/service_details_screen_part2.dart';
import 'package:beauty_ride/features/service_screen/presentation/pages/service_screen.dart';
import 'package:beauty_ride/features/splash/presentation/pages/splash_onboard.dart';
import 'package:beauty_ride/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final isIos = defaultTargetPlatform == TargetPlatform.iOS;
    final nameRoute = settings.name;

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
        // Ensure DashboardCubit is available for DashboardScreen
        // Try to get it from app-level context, otherwise create new instance
        Widget dashboardWidget;
        try {
          final currentContext = navigatorKey.currentContext;
          if (currentContext != null) {
            try {
              final cubit = currentContext.read<DashboardCubit>();
              dashboardWidget = BlocProvider.value(
                value: cubit,
                child: const DashboardScreen(),
              );
            } catch (e) {
              // If context doesn't have DashboardCubit, create new instance
              dashboardWidget = BlocProvider(
                create: (context) => DashboardCubit(),
                child: const DashboardScreen(),
              );
            }
          } else {
            // If context is not available, create new instance
            dashboardWidget = BlocProvider(
              create: (context) => DashboardCubit(),
              child: const DashboardScreen(),
            );
          }
        } catch (e) {
          // Fallback: create new instance if anything goes wrong
          dashboardWidget = BlocProvider(
            create: (context) => DashboardCubit(),
            child: const DashboardScreen(),
          );
        }
        return _buildRoute(dashboardWidget, isIos);
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
      case Routes.searchTruckScreen:
        return _buildRoute(SearchTruckScreen(), isIos);
      case Routes.truckingScreen:
        return _buildRoute(TruckingScreen(), isIos);
      case Routes.inServiceScreen:
        return _buildRoute(InServiceScreen(), isIos);
      case Routes.myBookingScreen:
        return _buildRoute(MyBookingsScreen(), isIos);
      case Routes.bookingScreen:
        return _buildRoute(BookingScreen(), isIos);

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
