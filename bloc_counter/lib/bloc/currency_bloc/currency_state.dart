abstract class CurrencyState {}

class SwitchState extends CurrencyState {
  final String flag1;
  final String curr1;
  final String flag2;
  final String curr2;

  SwitchState(
      {required this.flag1,
      required this.curr1,
      required this.flag2,
      required this.curr2});
}

class ConversionState extends CurrencyState {
  final String returendAmount;
  ConversionState({required this.returendAmount});
}

class InintialCurrencyState extends CurrencyState {
  final String flag1 = 'US';
  final String curr1 = 'USD';
  final String flag2 = 'SA';
  final String curr2 = 'SAR';
  final String amount = "";
}

class ErrorSttae extends CurrencyState {
  // final String msg1 = 'please eneter correct number to convert';
  // final String msg2 = 'please eneter an amount to convert';
  final String message;

  ErrorSttae({required this.message});
}
