// currency_bloc_bloc.dart

import 'package:currency_exchange/model/Currency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_bloc_event.dart';
part 'currency_bloc_state.dart';

class CurrencyBlocBloc extends Bloc<CurrencyBlocEvent, CurrencyBlocState> {
  CurrencyBlocBloc() : super(CurrencyBlocInitial()) {
    on<RiyalToDollar>((event, emit) {
      if (event.currency.amount == null) {
        return;
      }
      double convertedAmount =
          event.currency.amount! * 3.75; // Example conversion rate
      Currency updatedCurrency =
          event.currency.copyWith(amount: convertedAmount, toCurrency: 'USD');
      emit(UpdateCurrency(updatedCurrency));
    });

    on<RiyalToEuro>((event, emit) {
      if (event.currency.amount == null) {
        return;
      }
      double convertedAmount = event.currency.amount! *
          4; // Example conversion rate for Riyal to Euro
      Currency updatedCurrency =
          event.currency.copyWith(amount: convertedAmount, toCurrency: 'Euro');
      emit(UpdateCurrency(updatedCurrency));
    });
  }
}
