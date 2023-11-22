import 'package:exchange/bloc/currency_bloc.dart';
import 'package:exchange/screens/home_screen.dart';
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
      create: (context) => CurrencyBloc(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
