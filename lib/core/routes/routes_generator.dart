import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/auth/presentation/pages/login_screen.dart';
import 'package:beauty_ride/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:beauty_ride/features/dashboard/screens/dashboard_screen.dart';
import 'package:beauty_ride/features/on_boarding/pages/on_boarding_screen.dart';
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
      case Routes.login:
        return _buildRoute(const LoginScreen(), isIos);
      case Routes.signUp:
        return _buildRoute(const SignUpScreen(), isIos);
      case Routes.dashboard:
        return _buildRoute(DashboardScreen(), isIos);

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
