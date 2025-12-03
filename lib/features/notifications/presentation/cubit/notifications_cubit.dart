import 'package:beauty_ride/features/notifications/data/models/notifications_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  List<NotificationsModel> notifications = [
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
    NotificationsModel(
      id: 1,
      title: "Good news! Your rental request was accepted",
      subTitle: "The provider will contact you to arrange delivery.",
      date: "3 Mar 2025",
    ),
  ];
}
