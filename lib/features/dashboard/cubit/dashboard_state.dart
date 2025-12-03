part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState extends Equatable {}

final class DashboardInitial extends DashboardState {
  @override
  @override
  List<Object> get props => [];
}

final class SelectCard extends DashboardState {
  final int index;

  SelectCard({required this.index});

  @override
  List<Object> get props => [index];
}
