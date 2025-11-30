import 'package:flutter/material.dart';

class ThemeApp {
  //! Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF212937),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xff212937),
    ),
    bottomAppBarTheme: BottomAppBarThemeData(color: Color(0xff212937)),
    appBarTheme: AppBarThemeData(backgroundColor: Color(0xff212937)),
  );

  //! Light Theme
  static ThemeData lightTheme = ThemeData(
     brightness: Brightness.light,
  );
}
