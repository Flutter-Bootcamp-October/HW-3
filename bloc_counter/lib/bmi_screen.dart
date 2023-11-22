import 'package:bloc_counter/bloc/bmi_bloc/bmi_bloc.dart';
import 'package:bloc_counter/bloc/bmi_bloc/bmi_events.dart';
import 'package:bloc_counter/bloc/bmi_bloc/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController c1 =TextEditingController();
    TextEditingController c2 =TextEditingController();
    late  String title;
    late  Color scaffcolor;
    late  Color titlecolor;
    late  String bmiVal;
    return  BlocBuilder<BMIBloc, BMIState>(
      builder: (context, state) {
        if(state is InitialStateBMI){
          title = state.title;
          scaffcolor = state.scaffcolor;
          titlecolor = state.titlecolor;
          bmiVal = "";
        } else if(state is AverageState){
          title = state.title;
          scaffcolor = state.scaffcolor;
          titlecolor = state.titlecolor;
          bmiVal = "${state.bmi}";
        } else if(state is OverweightState){
          title = state.title;
          scaffcolor = state.scaffcolor;
          titlecolor = state.titlecolor;
          bmiVal = "${state.bmi}";
        }else if(state is UnderweightState){
          title = state.title;
          scaffcolor = state.scaffcolor;
          titlecolor = state.titlecolor;
          bmiVal = "${state.bmi}";
        } else if(state is ObeseState){
          title = state.title;
          scaffcolor = state.scaffcolor;
          titlecolor = state.titlecolor;
          bmiVal = "${state.bmi}";
        }
          return Scaffold(
          backgroundColor: scaffcolor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(title, style: TextStyle(fontSize: 50, color: titlecolor, fontWeight: FontWeight.bold)),
               const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SizedBox(width: 100,height:100,child: TextField(controller: c1, decoration: const InputDecoration(filled: true,labelStyle: TextStyle(fontSize: 20),label:Text("weight"),hintText: "in kg"), inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))])),
                const SizedBox(width: 100),
                SizedBox(width: 100,height:100,child: TextField(controller: c2,decoration: const InputDecoration(filled: true,labelStyle: TextStyle(fontSize: 20),label:Text("height"),hintText: "in cm"), inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))]))
              ]),
                SizedBox(width: 300,child: ElevatedButton(onPressed: (){context.read<BMIBloc>().add(BMIEvent(c1.text, c2.text));}, child: const Text("ENTER"))),
                Text(bmiVal, style: TextStyle(fontSize: 50, color: titlecolor)),
            ],
          )
        );
      }
    );
  }
}