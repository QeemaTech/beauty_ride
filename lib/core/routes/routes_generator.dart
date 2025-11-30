import 'package:beauty_ride/core/routes/routes.dart';
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
