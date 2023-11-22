import 'package:currency_exchange/screens/Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/currency_bloc_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CurrencyBlocBloc(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromRGBO(24, 24, 32, 1),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
