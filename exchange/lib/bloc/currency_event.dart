part of 'currency_bloc.dart';

abstract class CurrencyEvent {}

class UpdateNumberEvent extends CurrencyEvent {
  final Exchage Exchange;

  UpdateNumberEvent(this.Exchange);
}

class changeCurrencyEvent extends CurrencyEvent {
  final Currency from;
  final Currency to;

  changeCurrencyEvent(this.from, this.to);
}
