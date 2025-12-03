import 'package:beauty_ride/app/my_app.dart';
import 'package:beauty_ride/features/dashboard/models/screen_model.dart';
import 'package:beauty_ride/generated/l10n.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  void selectCard(int index) {
    currentIndex = index;
    emit(SelectCard(index: currentIndex));
  }

  // Convert widgets to a getter that depends on current language
  List<ScreenModel> getWidgets(BuildContext? context) {
    // Get translations based on current locale
    final tr = context != null 
        ? S.of(context) 
        : S.of(navigatorKey.currentContext ?? navigatorKey.currentState!.context);
    
    return [
      ScreenModel(id: 1, name: tr.homeScreen, icon: IconsResources.add),
      ScreenModel(id: 1, name: tr.personalInformation, icon: IconsResources.user),
      ScreenModel(id: 1, name: tr.myBookings, icon: IconsResources.taskSquare),
      ScreenModel(
        id: 1,
        name: tr.electronicWallet,
        icon: IconsResources.emptyWallet,
      ),
      ScreenModel(id: 1, name: tr.insuranceCards, icon: IconsResources.card),
      ScreenModel(id: 1, name: tr.savedAddresses, icon: IconsResources.location),
      ScreenModel(
        id: 1,
        name: tr.joinAsServiceProvider,
        icon: IconsResources.g2253,
      ),
      ScreenModel(id: 1, name: tr.language, icon: IconsResources.global),
      ScreenModel(id: 1, name: tr.customerService, icon: IconsResources.group),
      //ScreenModel(id: 1, name: tr.logout, icon: IconsResources.logout),
    ];
  }
}
