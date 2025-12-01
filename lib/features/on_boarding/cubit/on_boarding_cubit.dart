import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:beauty_ride/shared/resources/images_resources.dart';
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
    if (currentIndex < onBoardings.length - 1) {}
    currentIndex++;
    controller.animateToPage(
      currentIndex,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    emit(ChangePage(currentIndex));
  }

  List<OnBoardModel> onBoardings = [
    OnBoardModel(
      id: 1,
      title: "جمالك يبدأ من راحتك",
      subTitle: "كل خدمات التجميل اللي بتحبيها توصلك لحد باب بيتك...",
      image: ImagesResources.bg,
    ),
    OnBoardModel(
      id: 2,
      title: "إنتِ اللي بتحددي السعر",
      subTitle: "حددي السعر اللي يناسبك، واستني عروض الكوافيرين القريبين منك",
      image: ImagesResources.bg1,
    ),
    OnBoardModel(
      id: 2,
      title: " كوافيرك في الطريق إليك",
      subTitle: "تتبعي طلبك لحظة بلحظة، واستمتعي بخدمة احترافية في بيتك",
      image: ImagesResources.bg,
    ),
    OnBoardModel(
      id: 2,
      title: " كوافيرك في الطريق إليك",
      subTitle: "تتبعي طلبك لحظة بلحظة، واستمتعي بخدمة احترافية في بيتك",
      image: ImagesResources.bg3,
    ),
  ];
}
