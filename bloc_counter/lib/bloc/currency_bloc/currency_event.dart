abstract class CurrencyEvent {
  final String flag1;
  final String curr1;
  final String flag2;
  final String curr2;
  CurrencyEvent(
      {required this.flag1,
      required this.curr1,
      required this.flag2,
      required this.curr2});
}

class SwitchEvent extends CurrencyEvent {
  SwitchEvent(
      {required super.flag1,
      required super.curr1,
      required super.flag2,
      required super.curr2});
}

class ConvertEvent extends CurrencyEvent {
  final String amountToconvert;
  ConvertEvent(this.amountToconvert,
      {required super.flag1,
      required super.curr1,
      required super.flag2,
      required super.curr2});
}
