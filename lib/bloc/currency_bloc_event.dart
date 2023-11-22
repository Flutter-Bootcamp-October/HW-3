// currency_bloc_event.dart
part of 'currency_bloc_bloc.dart';

abstract class CurrencyBlocEvent {
  final Currency currency;

  CurrencyBlocEvent({required this.currency});
}

class RiyalToDollar extends CurrencyBlocEvent {
  RiyalToDollar({required Currency currency}) : super(currency: currency);
}

class RiyalToEuro extends CurrencyBlocEvent {
  RiyalToEuro({required Currency currency}) : super(currency: currency);
}

class CurrencySelectionChanged extends CurrencyBlocEvent {
  final String selectedCurrency;

  CurrencySelectionChanged({required this.selectedCurrency})
      : super(
            currency: Currency(
                amount: 0, fromCurrency: '', toCurrency: selectedCurrency));
}
