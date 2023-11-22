import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_bloc/model/history.dart';
part 'convert_event.dart';
part 'convert_state.dart';

class ConvertBloc extends Bloc<ConvertEvent, ConvertState> {
  ConvertBloc() : super(ConvertInitial()) {
    on<AddEvent>((event, emit) {
      try {
        if (event.price!.isEmpty) {
          emit(ErrorState(error: "Enter The Price Please"));
        } else if (event.from == "SAR" && event.to == "USD") {
          double price = double.parse(event.price!);
          String result = (price / 3.75).toStringAsFixed(2);
          History list = History(
              result: double.parse(result),
              price: price,
              from: event.from!,
              to: event.to!);
          listHistory.add(list);
          emit(ConvertResult(result: result));
        } else if (event.from == "USD" && event.to == "SAR") {
          double price = double.parse(event.price!);
          String result = (price * 3.75).toStringAsFixed(2);
          History list = History(
              result: double.parse(result),
              price: price,
              from: event.from!,
              to: event.to!);
          listHistory.add(list);
          emit(ConvertResult(result: result));
        } else if (event.from == event.to) {
          emit(ErrorState(error: "we cant convert same currency"));
        }
      } catch (e) {
        emit(ErrorState(error: "Enter A Correct Number Please"));
      }
    });
  }
}
