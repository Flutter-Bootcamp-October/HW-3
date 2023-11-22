abstract class CurrencyState {}

class InitialStatee extends CurrencyState {}

class totalcurrencyState extends CurrencyState {
  final double total;

  totalcurrencyState(this.total);
}

class EmptyState extends CurrencyState {}

class ErrorState extends CurrencyState {}
