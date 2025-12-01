import 'package:beauty_ride/app/my_app.dart';
import 'package:beauty_ride/core/routes/routes.dart';
import 'package:beauty_ride/features/splash/data/models/splash_model.dart';
import 'package:beauty_ride/shared/extentions/navigations.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  PageController controller = PageController();
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex(index: currentIndex));
  }

  void changeByController() {
    if (currentIndex == models.length - 1) {
     navigatorKey.currentContext!.pushReplacementNamed(Routes.onboard);
    }
    currentIndex++;
    controller.animateToPage(
      currentIndex,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    emit(ChangeIndex(index: currentIndex));
  }

  List<SplashModel> models = [
    SplashModel(icon: ImagesResources.b),
    SplashModel(icon: ImagesResources.b2),
    SplashModel(icon: ImagesResources.b3),
    SplashModel(icon: ImagesResources.b4),
  ];
}
