abstract class CurrencyState {
  final double convert;
  CurrencyState(this.convert);
}

class InitialState extends CurrencyState {
  InitialState(super.convert);
}

class UpdateState extends CurrencyState {
  UpdateState(super.convert);
}
