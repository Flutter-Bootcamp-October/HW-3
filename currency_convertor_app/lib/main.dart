import 'package:currency_convertor_app/bloc/currency_bloc.dart';
import 'package:currency_convertor_app/screens/convert_screen.dart';
import 'package:currency_convertor_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return CurrencyBloc();
      },
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
