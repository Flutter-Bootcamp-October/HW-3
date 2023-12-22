import 'package:currency_convertor_app/bloc/currency_event.dart';
import 'package:currency_convertor_app/bloc/currency_state.dart';
import 'package:currency_convertor_app/global/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(InitialState()) {
    //convert event
    on<ConvertUSDEvent>(
      (event, emit) {
        try {
          double converted = convertToUSD(event.currency.price!);
          historyList.add(event.currency);
          emit(UpdateState(convert: converted));
        } catch (e) {
          emit(ErrorState());
        }
      },
    );

    on<ConvertSAREvent>(
      (event, emit) {
        try {
          double converted = convertToSAR(event.currency.price!);
          historyList.add(event.currency);
          emit(UpdateState(convert: converted));
        } catch (e) {
          emit(ErrorState());
        }
      },
    );
  }
}
