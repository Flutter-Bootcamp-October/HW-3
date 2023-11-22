import 'package:bloc_homework_tues_week_7/BLoCs/currency_bloc/currency_bloc_bloc.dart';
import 'package:bloc_homework_tues_week_7/globals/globals.dart';
import 'package:bloc_homework_tues_week_7/screens/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  getCurrencyObjects();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrencyBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavBarController(),
      ),
    );
  }
}
