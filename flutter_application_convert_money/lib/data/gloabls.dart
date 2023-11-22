import 'package:flutter_application_convert_money/data/converts_data.dart';
import 'package:flutter_application_convert_money/model/convert_model.dart';

List<CurrencyConvert> listCurrencyConvertsData = [];
getCurrencyConvertsObject() {
  for (var element in currencyConvertsData) {
    listCurrencyConvertsData.add(CurrencyConvert.fromJson(element));
  }
}
