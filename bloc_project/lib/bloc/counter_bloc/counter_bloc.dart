import 'package:bloc_project/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_project/bloc/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<IncreaseEvent>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });

    on<DecreaseEvent>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });

    on<ResetEvent>((event, emit) {
      emit(CounterState(counter: 0));
    });
  }
}
