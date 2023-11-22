import 'package:bloc_project/bloc/sum_block/sum_event.dart';
import 'package:bloc_project/bloc/sum_block/sum_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SumBloc extends Bloc<SumEvent, SumState> {
  SumBloc() : super(InitialState()) {
    on<SumEvent>((event, emit) {
      try {
        if (event.num1.isEmpty || event.num2.isEmpty) {
          emit(EmptyState());
        } else {
          final num calculatedBMI = num.tryParse(event.num1)! /
              (num.tryParse(event.num2)! * num.tryParse(event.num2)!);
          String result = "no data";
          if (calculatedBMI <= 18.4) {
            result = "Underwight";
          } else if (calculatedBMI > 18.4 && calculatedBMI <= 24.9) {
            result = "Normal";
          } else if (calculatedBMI > 25 && calculatedBMI <= 39.9) {
            result = "OverWeight";
          } else if (calculatedBMI <= 40) {
            result = "OverWeight";
          }
          emit(ResultState(BMI: result, result: calculatedBMI));
        }
      } catch (err) {
        emit(ErrorState());
      }
    });
  }
}
