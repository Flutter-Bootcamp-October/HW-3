import 'package:flutter_application_convert_money/bloc/convert_event.dart';
import 'package:flutter_application_convert_money/bloc/convert_state.dart';
import 'package:flutter_application_convert_money/data/gloabls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertBloc extends Bloc<ConvertEvent, ConvertState> {
  ConvertBloc() : super(InitialConvertState()) {
    on<AddConvertEvent>(
      (event, emit) {
        if (event.currencyConvert.currencyFrom == "USD") {
          event.currencyConvert.resultConvert =
              event.currencyConvert.amount! * 3.75;
          event.currencyConvert.currencyFromUnit = "USD";
          event.currencyConvert.currencyToUnit = "SAR";
          event.currencyConvert.currencyFrom = "United States Dollar";
          event.currencyConvert.currencyTo = "Saudi Arabian Riyal";
        } else if (event.currencyConvert.currencyFrom == "SAR") {
          event.currencyConvert.resultConvert =
              event.currencyConvert.amount! * 0.27;
               event.currencyConvert.currencyFromUnit = "SAR";
          event.currencyConvert.currencyToUnit = "USD";
          event.currencyConvert.currencyFrom = "Saudi Arabian Riyal";
          event.currencyConvert.currencyTo = "United States Dollar";
        }

       
        listCurrencyConvertsData.add(event.currencyConvert);
        emit(UpdateConvertState());
      },
    );
  }
}
