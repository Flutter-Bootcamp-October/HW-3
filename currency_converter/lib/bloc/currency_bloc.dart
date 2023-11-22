import 'package:bloc/bloc.dart';
import 'package:currency_converter/bloc/currency_event.dart';
import 'package:currency_converter/bloc/currency_state.dart';
import 'package:currency_converter/data/global.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(InitialState()) {
    on<CurrencyConverterEvent>((event, emit) {
      try {
        if (event.currency.amout == null ||
            event.currency.fromCurrency == null ||
            event.currency.toCurrency == null) {
          emit(EmptyState());
        } else {
          num result = 0;

          switch (event.currency.fromCurrency) {
            case "SAR" || "sar":
              result = (event.currency.amout! / 3.57);
              break;
            case "USD" || "usd":
              result = (event.currency.amout! * 3.57);
          }
          final currencyResult = num.parse(result.toStringAsFixed(2));

          emit(ResultState(CurrencyResult: currencyResult));
        }
      } catch (e) {
        emit(ErrorState());
      }
    });
  }
}
