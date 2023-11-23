class Currency {
  Currency(
      {required this.amout,
      required this.fromCurrency,
      required this.toCurrency,
      this.result});

  num? amout;
  String? fromCurrency;
  String? toCurrency;
  String? result;

  Currency.fromJson(Map<String, dynamic> json) {
    amout = json['amout'];
    fromCurrency = json['fromCurrency'];
    toCurrency = json['toCurrency'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amout'] = amout;
    data['fromCurrency'] = fromCurrency;
    data['toCurrency'] = toCurrency;
    data['result'] = result;

    return data;
  }
}
