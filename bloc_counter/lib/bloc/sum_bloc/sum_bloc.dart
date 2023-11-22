import 'package:bloc_counter/bloc/sum_bloc/sum_event.dart';
import 'package:bloc_counter/bloc/sum_bloc/sum_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SumBloc extends Bloc<SumEvent, SumState>{
  SumBloc(): super(InitialState('....')){
    on<SumEvent>((event,state){
      if (event.num1.isEmpty || event.num2.isEmpty){
        emit(EmptyState());

      } else{
        try{
          emit(ResultState(num.parse(event.num1)+ num.parse(event.num1)));

        } catch(error){
          emit(ErrorState(error.toString()));

        }
      }
    });
  }
}