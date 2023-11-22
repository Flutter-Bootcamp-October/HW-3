import 'dart:math';

import 'package:currencychangerr/bloc/currency_event.dart';
import 'package:currencychangerr/bloc/currency_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(InitialStatee()) {
    on<CurrencyEvent>((event, emit) {
      double m1 = double.parse(event.monyNumber);
      double total = m1 * 3.75;
      emit(totalcurrencyState(total));
    });
  }
}
