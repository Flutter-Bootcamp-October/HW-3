import 'package:currency_converter/bloc/currency_bloc.dart';
import 'package:currency_converter/currency_converter_screen.dart';
import 'package:currency_converter/data/global.dart';
import 'package:currency_converter/home.dart';
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
        home: CurrencyConverterScreen(),
      ),
    );
  }
}
