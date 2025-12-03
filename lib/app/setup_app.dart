import 'dart:ui';

import 'package:beauty_ride/app/my_app.dart';
import 'package:beauty_ride/app/setup_app.dart' as AppStrings;
import 'package:beauty_ride/shared/classes/text_style.dart';
import 'package:beauty_ride/shared/cubits/location/location_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Locale arabic = Locale('ar');
const Locale english = Locale('en');

class SetupApp {
  // static LanguageModel? languageModel;
  // static List<LanguageModel> languageList = [
  //   LanguageModel(id: 1, txt: AppStrings.english),
  //   LanguageModel(id: 2, txt: AppStrings.arabic),
  // ];
  static Future<bool> getLocation(BuildContext context) async {
    LocationCubit locationCubit = BlocProvider.of(context, listen: false);
    bool? getLocation = await navigatorKey.currentContext!
        .read<LocationCubit>()
        .getGeoLocation(context);
    if (getLocation == true) {
      return true;
    } else {
      return false;
    }
  }
}

final titleAppBar = TextStyle(
  fontWeight: AppFontWeight.bold,
  fontSize: 18.sp,
  fontFamily: 'Inter',
);
