part of 'currency_bloc.dart';

abstract class CurrencyState {}

final class CurrencyInitial extends CurrencyState {}

class ResultState extends CurrencyState {
  final String result;
  ResultState(this.result);
}

class ErrorState extends CurrencyState {
  final String error;
  ErrorState(this.error);
}

class changeCurrncyState extends CurrencyState {
  final Currency from;
  final Currency to;

  changeCurrncyState(this.from, this.to);
}
