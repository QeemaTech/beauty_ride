import 'package:beauty_ride/app/my_app.dart';
import 'package:flutter/material.dart';

class ResponsiveScreen {
  static late double height;
  static late double width;

  static void initialize() {
    height = MediaQuery.of(navigatorKey.currentContext!).size.height;
    width = MediaQuery.of(navigatorKey.currentContext!).size.width;
  }
}
