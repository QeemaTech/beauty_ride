import 'package:beauty_ride/app/my_app.dart';
import 'package:beauty_ride/shared/resources/color_resources.dart';
import 'package:flutter/material.dart';

showSnackBar(String content) {
  ScaffoldMessenger.of(navigatorKey.currentContext!)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: ColorResources.primaryColor,
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
    );
}
