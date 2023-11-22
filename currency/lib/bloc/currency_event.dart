import 'package:currency/models/currency_model.dart';

abstract class currencyEvent {
  final conversionResultEvent result;

  currencyEvent(this.result);
}

class convertCurrencyEvent extends currencyEvent {
  convertCurrencyEvent(super.result);
}

class addCurrencyEvent extends currencyEvent {
  addCurrencyEvent(super.result);
}

class deleteCurrencyEvent extends currencyEvent {
  deleteCurrencyEvent(super.result);
}
