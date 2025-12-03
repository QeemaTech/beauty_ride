import 'package:beauty_ride/app/setup_app.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  init() async {
    await SetupApp.getLocation(context);
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        context.pushReplacementNamed(Routes.splashOnbording);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff004564),
      body: Center(child: Image.asset(ImagesResources.textsplash)),
    );
  }
}
