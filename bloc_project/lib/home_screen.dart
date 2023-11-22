import 'package:bloc_project/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_project/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_project/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) => Text(
                '${BlocProvider.of<CounterBloc>(context).state.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncreaseEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(ResetEvent());
              context.read<CounterBloc>().add(ResetEvent());
            },
            tooltip: 'Reset',
            child: const Icon(Icons.exposure_zero),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecreaseEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
