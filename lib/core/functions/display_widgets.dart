import 'package:beauty_ride/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

Widget displayWidgets(int index) {
  switch (index) {
    case 0:
      return HomeScreen();
    // case 1:
    //   return StatisticsScreen();
    // case 2:
    //   return CoursesScreen();
    // case 3:
    //   return StudentsScreen();
    // case 4:
    //   return Center(child: Text('cart'));
    // case 5:
    //   return ProfileScreen();
    case 6:
      return Center(child: Text('settings'));
    default:
      return HomeScreen();
  }
}
