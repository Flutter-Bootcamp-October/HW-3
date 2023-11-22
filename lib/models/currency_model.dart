class Currency {
  num? toAmount;
  bool? to;
  num? fromAmount;

  Currency({this.toAmount, this.to, this.fromAmount});

  Currency.fromJson(Map<String, dynamic> json) {
    toAmount = json['toAmount'];
    to = json['to'];
    fromAmount = json['fromAmount'];
  }
}
