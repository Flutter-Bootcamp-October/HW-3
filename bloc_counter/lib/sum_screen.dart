import 'package:bloc_counter/bloc/sum_bloc/sum_bloc.dart';
import 'package:bloc_counter/bloc/sum_bloc/sum_event.dart';
import 'package:bloc_counter/bloc/sum_bloc/sum_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SumScreen extends StatelessWidget {
  const SumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController c1 =TextEditingController();
    TextEditingController c2 =TextEditingController();
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           TextField(controller: c1, decoration: const InputDecoration(hintText: "enter number")),
           TextField(controller: c2,decoration: const InputDecoration(hintText: "enter number")),
          IconButton(onPressed: (){
            context.read<SumBloc>().add(SumEvent(c1.text, c2.text));
          }, icon: const Icon(Icons.add, size: 50)),

          BlocBuilder<SumBloc, SumState>(
            builder: (context,state){
              if(state is InitialState){
                return Text(state.placeHolder);
              } else if (state is ResultState){
                return Text('${state.total}');
              } else if(state is EmptyState){
                return Text(state.msg);
              } else if(state is ErrorState){
                return Text(state.error);
              }
              return Container();
            })

      ],)


    );
  }
}