import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashOnboard extends StatelessWidget {
  const SplashOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4C6C6),
      body: Center(child: SvgPicture.asset(IconsResources.textSplash)),
    );
  }
}
