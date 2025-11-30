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
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        context.pushReplacementNamed(Routes.splashOnbording);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff004564),
      body: Center(child: Image.asset(ImagesResources.textsplash)),
    );
  }
}
