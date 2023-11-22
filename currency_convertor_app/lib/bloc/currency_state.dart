abstract class CurrencyState {}

class InitialState extends CurrencyState {}

class UpdateState extends CurrencyState {
  final double convert;
  UpdateState({required this.convert});
}

class ErrorState extends CurrencyState {}
