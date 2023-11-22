import 'package:currency_convertor_app/bloc/currency_event.dart';
import 'package:currency_convertor_app/bloc/currency_state.dart';
import 'package:currency_convertor_app/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(InitialState(0)) {
    //convert event
    on<ConvertUSDEvent>(
      // ignore: void_checks
      (event, emit) {
        try {
          historyList.add(event.currency);
          convertToUSD(event.currency.price!);
          emit(UpdateState(event.currency.price!));
        } catch (e) {
          return Text("error");
        }
      },
    );

    on<ConvertSAREvent>(
      (event, emit) {
        historyList.add(event.currency);
        double convertValue;
        convertValue = convertToSAR(event.currency.price!);
        emit(UpdateState(convertValue));
      },
    );
    on<ConvertUSDEvent>(
      (event, emit) {
        historyList.add(event.currency);
        double convertValue;
        convertValue = convertToUSD(event.currency.price!);
        emit(UpdateState(convertValue));
      },
    );
  }
}
