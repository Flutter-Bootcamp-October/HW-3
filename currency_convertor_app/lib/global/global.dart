import 'package:currency_convertor_app/currency_model.dart';

List<Currency> historyList = [];

double convertToUSD(double number) {
  double result = number * 3.75;
  double converted = double.parse(result.toStringAsFixed(2));
  return converted;
}

double convertToSAR(double number) {
  double result = number * 0.27;
  double converted = double.parse(result.toStringAsFixed(2));
  return converted;
}