class Currency {
  double? _amount;
  String? _fromCurrency;
  String? _toCurrency;

  Currency({
    required double amount,
    required String fromCurrency,
    required String toCurrency,
  })  : _amount = amount,
        _fromCurrency = fromCurrency,
        _toCurrency = toCurrency;

  // Factory constructor
  factory Currency.create({
    required double amount,
    required String fromCurrency,
    required String toCurrency,
  }) {
    return Currency(
      amount: amount,
      fromCurrency: fromCurrency,
      toCurrency: toCurrency,
    );
  }

  // Getter methods
  double? get amount => _amount;
  String? get fromCurrency => _fromCurrency;
  String? get toCurrency => _toCurrency;

  // Setter methods
  void setAmount(double newAmount) {
    _amount = newAmount;
  }

  void setFromCurrency(String newFromCurrency) {
    _fromCurrency = newFromCurrency;
  }

  void setToCurrency(String newToCurrency) {
    _toCurrency = newToCurrency;
  }

  Currency copyWith({
    double? amount,
    String? fromCurrency,
    String? toCurrency,
  }) {
    return Currency(
      amount: amount ?? this._amount!,
      fromCurrency: fromCurrency ?? this._fromCurrency!,
      toCurrency: toCurrency ?? this._toCurrency!,
    );
  }
}
