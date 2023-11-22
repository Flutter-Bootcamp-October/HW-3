import 'package:currency_convertor_app/currency_model.dart';

abstract class CurrencyEvent {
  final Currency currency;

  CurrencyEvent(this.currency);
}


class ConvertUSDEvent extends CurrencyEvent {
  ConvertUSDEvent(super.currency);
}

class ConvertSAREvent extends CurrencyEvent {
  ConvertSAREvent(super.currency);
}
