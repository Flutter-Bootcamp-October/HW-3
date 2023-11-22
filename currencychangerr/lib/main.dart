import 'package:currencychangerr/bloc/currency_bloc.dart';
import 'package:currencychangerr/screens/home_screen.dart';
import 'package:currencychangerr/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CurrencyBloc(),
        child: MaterialApp(
            theme: ThemeData(brightness: Brightness.dark),
            home: WelcomeScreen()));
  }
}
