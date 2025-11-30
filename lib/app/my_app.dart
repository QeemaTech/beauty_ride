import 'package:beauty_ride/core/routes/routes_generator.dart';
import 'package:beauty_ride/core/theme/theme_app.dart';
import 'package:beauty_ride/features/splash/presentation/pages/splash_screen.dart';
import 'package:beauty_ride/shared/cubits/theme/theme_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.themeAppCubit});
  final ThemeAppCubit themeAppCubit;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => ThemeAppCubit(),
          child: BlocBuilder<ThemeAppCubit, ThemeAppState>(
            builder: (context, state) {
              return MaterialApp(
                 theme: ThemeApp.darkTheme,
                //theme: state.themeData,
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: RoutesGenerator.onGenerateRoute,
                home: child,
              );
            },
          ),
        );
      },
      child: SplashScreen(),
    );
  }
}
