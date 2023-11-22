import 'package:currency_converter/model/currency.dart';

abstract class CurrencyState {}

class InitialState extends CurrencyState {}

class ResultState extends CurrencyState {
  final num CurrencyResult;

  ResultState({required this.CurrencyResult});
}

class UpdatedHistoryState extends CurrencyState {}

class ErrorState extends CurrencyState {}

class EmptyState extends CurrencyState {}
