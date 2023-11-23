import 'package:currency_converter/model/currency.dart';

abstract class CurrencyEvent {}

class CurrencyConverterEvent extends CurrencyEvent {
  //final double amount;
  // final String fromCurrency;
  //final String toCurrency;
  final Currency currency;

  CurrencyConverterEvent({required this.currency});
}


