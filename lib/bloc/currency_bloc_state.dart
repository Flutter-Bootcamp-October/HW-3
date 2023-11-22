// currency_bloc_state.dart
part of 'currency_bloc_bloc.dart';

abstract class CurrencyBlocState {}

class CurrencyBlocInitial extends CurrencyBlocState {}

class UpdateCurrency extends CurrencyBlocState {
  final Currency currency; // Add this line

  UpdateCurrency(
      this.currency); // Modify the constructor to accept a Currency object
}
