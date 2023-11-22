// ignore_for_file: void_checks
import 'package:bloc/bloc.dart';
import 'package:bloc_currency_exchange/data/global_data.dart';
import 'package:bloc_currency_exchange/model/convert_model.dart';

part 'convert_event.dart';
part 'convert_state.dart';

class ConvertBloc extends Bloc<ConvertEvent, ConvertState> {
  String dropdownValue1 = 'SR';
  String dropdownValue2 = 'SR';

  ConvertBloc() : super(ConvertInitialState()) {
    on<ConvertBottonEvent>((event, emit) {
      try {
        num number = num.parse(event.convertNum);
        if (event.currentCurrency1 == 'SR' && event.currentCurrency2 == 'USD') {
          num convertToDollar = number / 3.75;

          listConver.add(ConvertHistoryModel(
              v1: number,
              c1: event.currentCurrency1,
              c2: event.currentCurrency2,
              v2: convertToDollar));

          emit(ResultConvertState(convertToDollar, event.currentCurrency1,
              event.currentCurrency2, number));
        } else if (event.currentCurrency1 == 'USD' &&
            event.currentCurrency2 == 'SR') {
          num convertToRiyal = number * 3.75;
          listConver.add(ConvertHistoryModel(
              v1: number,
              c1: event.currentCurrency1,
              c2: event.currentCurrency2,
              v2: convertToRiyal));
          emit(ResultConvertState(convertToRiyal, event.currentCurrency1,
              event.currentCurrency2, number));
        } else if (event.currentCurrency1 == 'SR' &&
            event.currentCurrency2 == 'SR') {
          num riyal = number;
          listConver.add(ConvertHistoryModel(
              v1: number,
              c1: event.currentCurrency1,
              c2: event.currentCurrency2,
              v2: riyal));
          emit(ResultConvertState(
              riyal, event.currentCurrency1, event.currentCurrency2, number));
        } else if (event.currentCurrency1 == 'USD' &&
            event.currentCurrency2 == 'USD') {
          num dollar = number;
          listConver.add(ConvertHistoryModel(
              v1: number,
              c1: event.currentCurrency1,
              c2: event.currentCurrency2,
              v2: dollar));
          emit(ResultConvertState(
              dollar, event.currentCurrency1, event.currentCurrency2, number));
        }
      } catch (e) {
        emit(EmptyState());
      }
    });

    on<ChangeCurrencyEvent1>((event, emit) {
      dropdownValue1 = event.currentCurrency!;
      emit(DropdownUpdatedState(dropdownValue1));
    });

    on<ChangeCurrencyEvent2>((event, emit) {
      dropdownValue2 = event.currentCurrency!;
      emit(DropdownUpdatedState(dropdownValue2));
    });
  }
}
