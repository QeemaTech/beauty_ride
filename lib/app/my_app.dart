import 'package:beauty_ride/core/routes/routes_generator.dart';
import 'package:beauty_ride/core/theme/theme_app.dart';
import 'package:beauty_ride/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:beauty_ride/features/language/presentation/cubit/language_cubit.dart';
import 'package:beauty_ride/features/search_truck/presentation/cubit/search_truck_cubit.dart';
import 'package:beauty_ride/features/splash/presentation/pages/splash_screen.dart';
import 'package:beauty_ride/generated/l10n.dart';
import 'package:beauty_ride/shared/cubits/location/location_cubit.dart';
import 'package:beauty_ride/shared/cubits/theme/theme_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ThemeAppCubit()),
            BlocProvider(create: (context) => LocationCubit()),
            BlocProvider(create: (context) => SearchTruckCubit()),
            BlocProvider(create: (context) => DashboardCubit()),
            BlocProvider(create: (context) => LanguageCubit()),
          ],
          child: BlocBuilder<ThemeAppCubit, ThemeAppState>(
            builder: (context, themeState) {
              return BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, languageState) {
                  final locale = languageState is LanguageLoaded
                      ? languageState.locale
                      : const Locale('ar');

                  return MaterialApp(
                    theme: ThemeApp.lightTheme,
                    //theme: themeState.themeData,
                    navigatorKey: navigatorKey,
                    debugShowCheckedModeBanner: false,
                    onGenerateRoute: RoutesGenerator.onGenerateRoute,
                    localizationsDelegates: [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    locale: locale,
                    home: child,
                  );
                },
              );
            },
          ),
        );
      },
      child: SplashScreen(),
    );
  }
}
