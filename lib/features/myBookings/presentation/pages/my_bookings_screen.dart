import 'package:beauty_ride/shared/widgets/custom_body_app.dart';
import 'package:flutter/material.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBodyApp(
        child: Column(
          children: [
            Text("hello")
          ],
        ),
      ),
    );
  }
}