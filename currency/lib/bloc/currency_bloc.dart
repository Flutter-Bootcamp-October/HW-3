import 'package:bloc/bloc.dart';
import 'package:currency/bloc/currency_event.dart';
import 'package:currency/models/currency_model.dart';
import 'currency_state.dart';

class currencyBloc extends Bloc<currencyEvent, currencyState> {
  currencyBloc() : super(currencyInitialState()) {
    on<addCurrencyEvent>((event, emit) {
      results.add(event.result);
      emit(currencyUpdatedState());
    });

    on<convertCurrencyEvent>((event, emit) {
      event.result.convertedAmount =
          event.result.amount * getCurrency(event.result.targetCurrency);
      emit(currencyUpdatedState());
    });

    on<deleteCurrencyEvent>((event, emit) {
      results.remove(event.result);
      emit(currencyUpdatedState());
    });
  }

  double getCurrency(targetCurrency) {
    switch (targetCurrency) {
      case 'rupees':
        return 75;
      case 'euros':
        return 0.85;
      case 'RS':
        return 3.75;
      default:
        return 1.0;
    }
  }
}
