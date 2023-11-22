import 'package:flutter/material.dart';
import 'package:flutter_application_convert_money/bloc/convert_bloc.dart';
import 'package:flutter_application_convert_money/data/gloabls.dart';
import 'package:flutter_application_convert_money/pages/list_of_convert.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  getCurrencyConvertsObject();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConvertBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ListOfConverts(),
      ),
    );
  }
}
