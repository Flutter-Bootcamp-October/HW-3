import 'package:bloc/bloc.dart';
import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_converter.dart';
import 'package:exchange/models/currency.dart';
import 'package:exchange/screens/home_screen.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitial()) {
    on<UpdateNumberEvent>((event, emit) async {
      try {
        var usdConvert = await CurrencyConverter.convert(
          from: event.Exchange.to!,
          to: event.Exchange.from!,
          amount: double.parse(event.Exchange.amount!),
        );
        print(usdConvert);
        event.Exchange.result = usdConvert;
        exchangeList.add(event.Exchange);
        emit(ResultState(usdConvert.toString()));
      } catch (error) {
        emit(ErrorState(error.toString()));
      }
    });
    on<changeCurrencyEvent>((event, emit) async {
      final Currency from = event.to;
      final Currency to = event.from;
      emit(changeCurrncyState(from, to));
    });
  }
}
