abstract class CurrencyState {}

class InitState extends CurrencyState {}

class ShowResultWhenTrueState extends CurrencyState {
  num result;

  ShowResultWhenTrueState({required this.result});
}

class ShowResultWhenFalseState extends CurrencyState {
  num result;

  ShowResultWhenFalseState({required this.result});
}

class SwitchProcessState extends CurrencyState {}
