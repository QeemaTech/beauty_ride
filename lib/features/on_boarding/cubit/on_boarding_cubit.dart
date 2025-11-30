import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model/on_board_model.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  PageController controller = PageController();
  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    emit(ChangePage(currentIndex));
  }

  void nextPage() {
    currentIndex++;
    if (currentIndex < onBoardings.length - 1) {}
    controller.animateToPage(
      currentIndex,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    //controller.jumpToPage(currentIndex);
    emit(ChangeIndex(currentIndex));
  }

  List<OnBoardModel> onBoardings = [
    OnBoardModel(
      id: 1,
      nameApp: "AGORA",
      title: "Everything You Need, in One Place",
      subTitle:
          "Find experts, rent equipment, and shop trusted stores all in one powerful platform",
      image: IconsResources.maskGroup,
    ),
    OnBoardModel(
      id: 2,
      nameApp: "AGORA",
      title: "Everything You Need, in One Place",
      subTitle:
          "Find experts, rent equipment, and shop trusted stores all in one powerful platform",
      image: IconsResources.maskGroup,
    ),
    OnBoardModel(
      id: 2,
      nameApp: "AGORA",
      title: "Everything You Need, in One Place",
      subTitle:
          "Find experts, rent equipment, and shop trusted stores all in one powerful platform",
      image: IconsResources.maskGroup,
    ),
  ];
}
