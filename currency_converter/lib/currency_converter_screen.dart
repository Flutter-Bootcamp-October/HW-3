import 'package:currency_converter/bloc/currency_bloc.dart';
import 'package:currency_converter/bloc/currency_event.dart';
import 'package:currency_converter/bloc/currency_state.dart';
import 'package:currency_converter/home.dart';
import 'package:currency_converter/model/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyConverterScreen extends StatelessWidget {
  CurrencyConverterScreen({super.key});
  TextEditingController amount = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              icon: Icon(Icons.arrow_back)),
          TextField(
            controller: amount,
            decoration: const InputDecoration(hintText: "amount"),
          ),
          TextField(
            controller: from,
            decoration: const InputDecoration(hintText: "from"),
          ),
          TextField(
            controller: to,
            decoration: const InputDecoration(hintText: "to"),
          ),
          ElevatedButton(
              onPressed: () {
                Currency currency = Currency(
                  amout: num.parse(amount.text),
                  fromCurrency: from.text,
                  toCurrency: to.text,
                );

                context.read<CurrencyBloc>().add(
                      CurrencyConverterEvent(currency: currency),
                    );
              },
              child: Text("convert")),
          BlocBuilder<CurrencyBloc, CurrencyState>(builder: (context, state) {
            if (state is EmptyState) {
              return Text("please enter all filed");
            } else if (state is ResultState) {
              return Text("${amount.text} = ${state.CurrencyResult}");
            } else if (state is ErrorState) {
              return Text("error");
            }

            return Text(" ");
          })
        ],
      ),
    ));
  }
}
