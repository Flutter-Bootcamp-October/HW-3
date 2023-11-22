part of 'currency_bloc.dart';

abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}

class ConvertFromSarToUsdState extends CurrencyState {
  final double amount;

  ConvertFromSarToUsdState({required this.amount});
}

class ConvertFromUSDToSarState extends CurrencyState {
  final double amount;

  ConvertFromUSDToSarState({required this.amount});
}

class ErrState extends CurrencyState {}

// class ResultState extends CurrencyState {
//   final double amount;
//
//   ResultState({required this.amount});
// }
