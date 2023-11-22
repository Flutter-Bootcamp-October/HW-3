class Currency {
  int? id;
  String? currency;
  double? price;

  Currency({
    required this.id,
    required this.currency,
    required this.price,
  });

  factory Currency.fromJson(Map json) {
    return Currency(
      id: json['id'],
      currency: json['currency'],
      price: json['price'],
    );
  }
}
