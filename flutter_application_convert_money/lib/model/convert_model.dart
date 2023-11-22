class CurrencyConvert {
  double? amount;
  String? currencyFrom;
  String? currencyTo;
  double? resultConvert;
  String? currencyFromUnit;
  String? currencyToUnit;

  CurrencyConvert(
      {this.amount,
      this.currencyFrom,
      this.currencyTo,
      this.resultConvert,
      this.currencyFromUnit,
      this.currencyToUnit});

  CurrencyConvert.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyFrom = json['currency_from'];
    currencyTo = json['currency_to'];
    resultConvert = json['resultConvert'];
    currencyFromUnit = json['currency_from_unit'];
    currencyToUnit = json['currency_to_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency_from'] = this.currencyFrom;
    data['currency_to'] = this.currencyTo;
    data['resultConvert'] = this.resultConvert;
    data['currency_from_unit'] = this.currencyFromUnit;
    data['currency_to_unit'] = this.currencyToUnit;
    return data;
  }
}
