import 'package:bloc_homework_tues_week_7/models/currency_model.dart';

abstract class CurrencytEvent {
  final Currency currency;
  CurrencytEvent({required this.currency});
}

class ProcessEvent extends CurrencytEvent {
  ProcessEvent({
    required super.currency,
  });
}

class ChangeProcessEvent extends CurrencytEvent {
  ChangeProcessEvent({required super.currency});
}
