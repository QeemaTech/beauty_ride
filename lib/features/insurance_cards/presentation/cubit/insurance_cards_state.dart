part of 'insurance_cards_cubit.dart';

abstract class InsuranceCardsState extends Equatable {
  const InsuranceCardsState();

  @override
  List<Object> get props => [];
}

class InsuranceCardsInitial extends InsuranceCardsState {}

class InsuranceCardsLoaded extends InsuranceCardsState {
  final List<InsuranceCardModel> cards;

  const InsuranceCardsLoaded({required this.cards});

  InsuranceCardsLoaded copyWith({
    List<InsuranceCardModel>? cards,
  }) {
    return InsuranceCardsLoaded(
      cards: cards ?? this.cards,
    );
  }

  @override
  List<Object> get props => [cards];
}
