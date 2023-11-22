part of 'convert_bloc.dart';

abstract class ConvertEvent {}

class ConvertBottonEvent extends ConvertEvent {
  final String convertNum;
  final String? currentCurrency1;
  final String? currentCurrency2;

  ConvertBottonEvent({
    required this.currentCurrency1,
    required this.convertNum,
    required this.currentCurrency2,
  });
}

class ChangeCurrencyEvent1 extends ConvertEvent {
  final String? currentCurrency;
  ChangeCurrencyEvent1({required this.currentCurrency});
}

class ChangeCurrencyEvent2 extends ConvertEvent {
  final String? currentCurrency;
  ChangeCurrencyEvent2({required this.currentCurrency});
}
