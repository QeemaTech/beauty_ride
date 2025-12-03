import 'package:beauty_ride/features/service_screen/data/models/service_model.dart';
import 'package:beauty_ride/shared/resources/icons_resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'service_screen_state.dart';

class ServiceScreenCubit extends Cubit<ServiceScreenState> {
  ServiceScreenCubit() : super(ServiceScreenInitial());

  List<ServiceModel> services = [
    // Row 1
    ServiceModel(id: 4, title: "skinCleansing", icon: IconsResources.face),
    ServiceModel(id: 3, title: "manicure", icon: IconsResources.mankir),
    ServiceModel(id: 1, title: "wax", icon: IconsResources.waks),
    ServiceModel(id: 2, title: "massage", icon: IconsResources.massage),
    // Row 2
    ServiceModel(id: 4, title: "skinCleansing", icon: IconsResources.face),
    ServiceModel(id: 3, title: "manicure", icon: IconsResources.mankir),
    ServiceModel(id: 1, title: "wax", icon: IconsResources.waks),
    ServiceModel(id: 2, title: "massage", icon: IconsResources.massage),
    // Row 3
    ServiceModel(id: 4, title: "skinCleansing", icon: IconsResources.face),
    ServiceModel(id: 3, title: "manicure", icon: IconsResources.mankir),
    ServiceModel(id: 1, title: "wax", icon: IconsResources.waks),
    ServiceModel(id: 2, title: "massage", icon: IconsResources.massage),
    // Row 4
    ServiceModel(id: 4, title: "skinCleansing", icon: IconsResources.face),
    ServiceModel(id: 3, title: "manicure", icon: IconsResources.mankir),
    ServiceModel(id: 1, title: "wax", icon: IconsResources.waks),
    ServiceModel(id: 2, title: "massage", icon: IconsResources.massage),
  ];
}
