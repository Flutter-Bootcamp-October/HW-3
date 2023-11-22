abstract class ConverterEvent {}

class ConvertEvent extends ConverterEvent {
  String currentCurrencyType;
  String convertedCurrency;
  double value;

  ConvertEvent(
      {required this.currentCurrencyType,
      required this.convertedCurrency,
      required this.value});
}
