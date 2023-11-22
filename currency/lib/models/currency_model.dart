List<conversionResultEvent> results = [];

class conversionResultEvent {
  double amount;
  double convertedAmount;
  String targetCurrency;

  conversionResultEvent({
    required this.amount,
    required this.convertedAmount,
    required this.targetCurrency,
  });
}
