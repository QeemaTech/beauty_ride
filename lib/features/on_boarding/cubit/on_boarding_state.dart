part of 'on_boarding_cubit.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();
}

final class OnBoardingInitial extends OnBoardingState {
  @override
  List<Object> get props => [];
}
final class ChangeIndex extends OnBoardingState {
  final int currentIndex;
  const ChangeIndex(this.currentIndex);
  @override
  List<Object> get props => [currentIndex];
}
final class ChangePage extends OnBoardingState {
  final int index;
  const ChangePage(this.index);
  @override
  List<Object> get props => [index];
}
