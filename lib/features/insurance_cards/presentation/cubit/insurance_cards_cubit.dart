import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'insurance_cards_state.dart';

class InsuranceCardModel {
  final String id;
  final String companyName;
  final String cardNumber;
  final String expiryDate;
  final String? holderName;
  final bool isDefault;

  InsuranceCardModel({
    required this.id,
    required this.companyName,
    required this.cardNumber,
    required this.expiryDate,
    this.holderName,
    this.isDefault = false,
  });
}

class InsuranceCardsCubit extends Cubit<InsuranceCardsState> {
  InsuranceCardsCubit() : super(InsuranceCardsInitial()) {
    loadInsuranceCards();
  }

  void loadInsuranceCards() {
    // TODO: Load from repository/API
    final cards = [
      InsuranceCardModel(
        id: '1',
        companyName: 'تأمين صحي',
        cardNumber: '1234 5678 9012 3456',
        expiryDate: '2025-12-31',
        holderName: 'هبه ياسر',
        isDefault: true,
      ),
      InsuranceCardModel(
        id: '2',
        companyName: 'تأمين صحي',
        cardNumber: '9876 5432 1098 7654',
        expiryDate: '2026-06-30',
        holderName: 'هبه ياسر',
        isDefault: false,
      ),
    ];

    emit(InsuranceCardsLoaded(cards: cards));
  }

  void addCard(InsuranceCardModel card) {
    if (state is InsuranceCardsLoaded) {
      final currentState = state as InsuranceCardsLoaded;
      final updatedCards = List<InsuranceCardModel>.from(currentState.cards)
        ..add(card);
      emit(currentState.copyWith(cards: updatedCards));
    }
  }

  void updateCard(String id, InsuranceCardModel updatedCard) {
    if (state is InsuranceCardsLoaded) {
      final currentState = state as InsuranceCardsLoaded;
      final updatedCards = currentState.cards.map((card) {
        if (card.id == id) {
          return updatedCard;
        }
        return card;
      }).toList();
      emit(currentState.copyWith(cards: updatedCards));
    }
  }

  void deleteCard(String id) {
    if (state is InsuranceCardsLoaded) {
      final currentState = state as InsuranceCardsLoaded;
      final updatedCards = currentState.cards
          .where((card) => card.id != id)
          .toList();
      emit(currentState.copyWith(cards: updatedCards));
    }
  }

  void setDefaultCard(String id) {
    if (state is InsuranceCardsLoaded) {
      final currentState = state as InsuranceCardsLoaded;
      final updatedCards = currentState.cards.map((card) {
        return InsuranceCardModel(
          id: card.id,
          companyName: card.companyName,
          cardNumber: card.cardNumber,
          expiryDate: card.expiryDate,
          holderName: card.holderName,
          isDefault: card.id == id,
        );
      }).toList();
      emit(currentState.copyWith(cards: updatedCards));
    }
  }
}
