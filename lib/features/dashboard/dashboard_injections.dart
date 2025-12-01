import 'package:beauty_ride/app_injections.dart';
import 'package:beauty_ride/features/dashboard/cubit/dashboard_cubit.dart';

void dashboardInjections() {
  sl.registerFactory<DashboardCubit>(() => DashboardCubit());
}
