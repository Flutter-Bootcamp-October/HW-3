part of 'currency_bloc.dart';

abstract class CurrencyEvent {
  final ConvertModel convert;

  CurrencyEvent({required this.convert});
}

class ConvertFromSarToUsdEvent extends CurrencyEvent {
  ConvertFromSarToUsdEvent({required super.convert});
}

class ConvertFromUSDToSarEvent extends CurrencyEvent {
  ConvertFromUSDToSarEvent({required super.convert});
}
