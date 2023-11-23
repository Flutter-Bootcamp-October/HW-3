import 'package:currency_converter/bloc/currency_bloc.dart';
import 'package:currency_converter/bloc/currency_state.dart';
import 'package:currency_converter/currency_converter_screen.dart';
import 'package:currency_converter/data/global.dart';
import 'package:currency_converter/widgets/currency_history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CurrencyConverterScreen()));
                  },
                  icon: Icon(Icons.arrow_back)),
              BlocBuilder<CurrencyBloc, CurrencyState>(
                  builder: (context, state) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    for (var element in listCurrencyObject)
                      CurrencyHistoryCard(currency: element)
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
