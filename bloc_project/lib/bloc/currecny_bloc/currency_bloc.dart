import 'package:bloc_project/data/global.dart';
import 'package:bloc_project/models/convert_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitial()) {
    on<ConvertFromSarToUsdEvent>((event, emit) {
      try {
        event.convert.toAmount = event.convert.fromAmount! / 3.75;
        historyList.add(event.convert);
        emit(ConvertFromSarToUsdState(amount: event.convert.toAmount!));
      } catch (err) {
        emit(ErrState());
        print(err);
      }
    });
    on<ConvertFromUSDToSarEvent>((event, emit) {
      try {
        event.convert.toAmount = event.convert.fromAmount! * 3.75;
        historyList.add(event.convert);
        emit(ConvertFromUSDToSarState(amount: event.convert.toAmount!));
      } catch (err) {
        emit(ErrState());
        print(err);
      }
    });
  }
}
