import 'package:bloc_counter/bloc/currency_bloc/currency_event.dart';
import 'package:bloc_counter/bloc/currency_bloc/currency_state.dart';
import 'package:bloc_counter/global/globals.dart';
import 'package:bloc_counter/models/currenc_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(InintialCurrencyState()) {
    on<SwitchEvent>((event, state) {
      emit(SwitchState(
          flag1: event.flag2,
          curr1: event.curr2,
          flag2: event.flag1,
          curr2: event.curr1));
    });
    on<ConvertEvent>((event, state) {
      if (event.amountToconvert.isEmpty) {
        emit(ErrorSttae(message: 'please enter an amount to convert'));
      } else {
        try {
          double amount = double.parse(event.amountToconvert);
          if (event.curr1 == 'USD') {
            amount = amount * 3.75;
            emit(ConversionState(returendAmount: (amount).toStringAsFixed(2)));
          } else {
            amount = amount * 0.27;
            emit(ConversionState(returendAmount: (amount).toStringAsFixed(2)));
          }
          CurrencyCard newCard = CurrencyCard(
              fromAmount: event.amountToconvert,
              toAmount: (amount).toStringAsFixed(2),
              fromCurrency: event.curr1,
              toCureency: event.curr2);
          conversionsHisory.add(newCard);
        } catch (error) {
          emit(ErrorSttae(message: 'please enter a real amount to convert'));
        }
      }
    });
  }
}
