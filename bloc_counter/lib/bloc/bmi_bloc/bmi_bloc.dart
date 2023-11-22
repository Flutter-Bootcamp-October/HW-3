import 'package:bloc_counter/bloc/bmi_bloc/bmi_events.dart';
import 'package:bloc_counter/bloc/bmi_bloc/bmi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMIBloc extends Bloc<BMIEvent, BMIState>{
  BMIBloc(): super(InitialStateBMI()){
    on<BMIEvent>((event,state){
      if (event.num1.isEmpty || event.num2.isEmpty){
        emit(InitialStateBMI());

      } else{
        double weight = double.parse(event.num1);
        double height = double.parse(event.num2)/100;
        double bmiVal = weight/(height*height);
        bmiVal = double.parse((bmiVal).toStringAsFixed(2));
        if(bmiVal <= 18.4 ){
          emit(UnderweightState(bmiVal));
        } else if(bmiVal > 18.4 && bmiVal <= 24.9){
          emit(AverageState(bmiVal));
        } else if(bmiVal > 24.9 && bmiVal <= 29.9){
          emit(OverweightState(bmiVal));
        } else{
          emit(ObeseState(bmiVal));
        }
      }
    });
  }
}