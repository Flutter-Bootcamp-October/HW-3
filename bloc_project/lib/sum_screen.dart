import 'package:bloc_project/bloc/sum_block/sum_block.dart';
import 'package:bloc_project/bloc/sum_block/sum_event.dart';
import 'package:bloc_project/bloc/sum_block/sum_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SumScreen extends StatelessWidget {
  const SumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController num1 = TextEditingController();
    final TextEditingController num2 = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: num1,
                decoration: const InputDecoration(hintText: "Weight in KG"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: num2,
                decoration: const InputDecoration(hintText: "Height in Meters"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<SumBloc>(context)
                      .add(SumEvent(num1: num1.text, num2: num2.text));
                },
                child: const Text("Find BMI")),
            BlocBuilder<SumBloc, SumState>(
              builder: (context, state) {
                if (state is InitialState) {
                  return const Text("..");
                } else if (state is ResultState) {
                  return Text(
                      "Your BMI is ${state.result.roundToDouble()} and it is ${state.BMI}");
                } else if (state is ErrorState) {
                  return const Text("Err");
                } else if (state is EmptyState) {
                  return const Text("Empty");
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
