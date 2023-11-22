import 'package:flutter_application_convert_money/model/convert_model.dart';

abstract class ConvertEvent {
  CurrencyConvert currencyConvert;

  ConvertEvent(this.currencyConvert);
}

class AddConvertEvent extends ConvertEvent {
  AddConvertEvent(super.currencyConvert);
}
