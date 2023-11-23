import 'package:currency_converter/data/currency_history_data.dart';
import 'package:currency_converter/model/currency.dart';

List<Currency> listCurrencyObject = [];
getCurrencyObjects() {
  for (var element in currencyHistoryData) {
    listCurrencyObject.add(Currency.fromJson(element));
  }
}

