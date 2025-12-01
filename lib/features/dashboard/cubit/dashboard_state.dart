part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState extends Equatable {}

final class DashboardInitial extends DashboardState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// final class ChangeColor extends DashboardState {
//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }

final class SelectCard extends DashboardState {
  final int index;

  SelectCard({required this.index});

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
