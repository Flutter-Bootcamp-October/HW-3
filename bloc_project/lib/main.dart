import 'package:bloc_project/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_project/bloc/currecny_bloc/currency_bloc.dart';
import 'package:bloc_project/bloc/sum_block/sum_block.dart';
import 'package:bloc_project/currency/currency_screen.dart';
import 'package:bloc_project/home_screen.dart';
import 'package:bloc_project/sum_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrencyBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CurrencyScreen(),

        // BlocProvider(
        //     create: (context) => SumBloc(), child: const SumScreen()),

        // BlocProvider(
        //     create: (context) => CounterBloc(),
        //     child: const MyHomePage(title: 'Flutter Demo Home Page')),
      ),
    );
  }
}
