import 'package:currency/models/currency_model.dart';

abstract class currencyState {}

class currencyInitialState extends currencyState {}

class currencyLoadingState extends currencyState {}

class currencyConvertedState extends currencyState {
  final conversionResultEvent conversionResult;

  currencyConvertedState(this.conversionResult);
}

class currencyUpdatedState extends currencyState {}
