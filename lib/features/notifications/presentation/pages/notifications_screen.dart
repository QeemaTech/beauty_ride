import 'package:beauty_ride/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:beauty_ride/features/notifications/presentation/widgets/display_notification.dart';
import 'package:beauty_ride/features/on_boarding/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit(),
      child: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          final cubit = context.read<NotificationsCubit>();
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: CustomAppbar(title: "Notifications", isActionIcon: false),
            ),
            body: ListView.separated(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              itemBuilder: (_, index) {
                final notification = cubit.notifications[index];
                return DisplayNotification(
                  title: notification.title,
                  subTitle: notification.subTitle,
                  date: notification.date,
                );
              },
              separatorBuilder: (_, index) => SizedBox(height: 8.h),
              itemCount: cubit.notifications.length,
            ),
          );
        },
      ),
    );
  }
}
