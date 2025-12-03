import 'package:beauty_ride/app/my_app.dart';
import 'package:beauty_ride/generated/l10n.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/on_board_model.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  PageController controller = PageController();
  int currentIndex = 0;
  
  // Convert to getter that depends on current language
  List<OnBoardModel> getOnBoardings(BuildContext? context) {
    final tr = context != null 
        ? S.of(context) 
        : S.of(navigatorKey.currentContext ?? navigatorKey.currentState!.context);
    
    return [
      OnBoardModel(
        id: 1,
        title: tr.beautyStartsFromComfort,
        subTitle: tr.allBeautyServicesDelivered,
        image: ImagesResources.bg,
      ),
      OnBoardModel(
        id: 2,
        title: tr.youSetThePrice,
        subTitle: tr.setPriceAndWaitForOffers,
        image: ImagesResources.bg1,
      ),
      OnBoardModel(
        id: 3,
        title: tr.yourHairdresserOnTheWay,
        subTitle: tr.trackOrderMomentByMoment,
        image: ImagesResources.bg,
      ),
      OnBoardModel(
        id: 4,
        title: tr.yourHairdresserOnTheWay,
        subTitle: tr.trackOrderMomentByMoment,
        image: ImagesResources.bg3,
      ),
    ];
  }

  void changePage(int index) {
    currentIndex = index;
    emit(ChangePage(currentIndex));
  }

  void nextPage(int totalPages) {
    if (currentIndex < totalPages - 1) {
      currentIndex++;
      controller.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      emit(ChangePage(currentIndex));
    }
  }
}
