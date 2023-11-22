import 'package:bloc_counter/bloc/counter_bloc/counter_events.dart';
import 'package:bloc_counter/bloc/counter_bloc/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState>{
  CounterBloc(): super(CounterState(0)){
    on<IncrementEvent>((event, emit){
      emit(CounterState(state.counter+1));
    });
    on<DecrementEvent>((event, emit){
      emit(CounterState(state.counter-1));
    });
    on<ResetEvent>((event, emit){
      emit(CounterState(0));
    });
  }
}