import 'package:currency_convert/bloc/converter_event.dart';
import 'package:currency_convert/bloc/converter_state.dart';
import 'package:currency_convert/data/globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc() : super(ConvertState(result: "")) {
    on<ConvertEvent>((event, emit) {
      String result = "";
      if (event.value.isNaN) {
        print("hhhhhhhhhhhhhh");
      }
      if (event.currentCurrencyType == "SAR") {
        if (event.convertedCurrency == "USD") {
          result = (event.value / 3.75).toStringAsFixed(2);
        } else if (event.currentCurrencyType == "SAR") {
          result = (event.value).toStringAsFixed(2);
        }
      } else if (event.convertedCurrency == "USD") {
        if (event.convertedCurrency == "SAR") {
          result = (event.value * 3.75).toStringAsFixed(2);
        } else if (event.convertedCurrency == "USD") {
          result = (event.value).toStringAsFixed(2);
        }
      } else {
        result = 'Error';
      }
      emit(ConvertState(result: result));
      history.add(
          "Convert ${event.value} ${event.currentCurrencyType} ----> $result ${event.convertedCurrency}");
    });
  }
}
