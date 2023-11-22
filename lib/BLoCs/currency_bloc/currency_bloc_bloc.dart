import 'package:bloc_homework_tues_week_7/BLoCs/currency_bloc/currency_bloc_event.dart';
import 'package:bloc_homework_tues_week_7/BLoCs/currency_bloc/currency_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyBloc extends Bloc<CurrencytEvent, CurrencyState> {
  CurrencyBloc() : super(InitState()) {
    on<ProcessEvent>(
      (event, emit) {
        if (event.currency.to == true) {
          num result = event.currency.toAmount! * 3.75;
          emit(ShowResultWhenTrueState(result: result));
        } else {
          num result = event.currency.toAmount! / 3.75;
          emit(ShowResultWhenTrueState(result: result));
        }
      },
    );
  }
}
