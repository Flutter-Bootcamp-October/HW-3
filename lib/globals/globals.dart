import 'package:bloc_homework_tues_week_7/data/currency_data.dart';
import 'package:bloc_homework_tues_week_7/models/currency_model.dart';

List<Currency> listOfCurrencyObjects = [];
getCurrencyObjects() {
  for (var element in currencyData) {
    listOfCurrencyObjects.add(Currency.fromJson(element));
  }
}
