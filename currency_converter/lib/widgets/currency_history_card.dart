import 'package:currency_converter/model/currency.dart';
import 'package:flutter/material.dart';

class CurrencyHistoryCard extends StatelessWidget {
  CurrencyHistoryCard({super.key, required this.currency});

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Text(
          "amount: ${currency.amout}",
        ),
        Text(
          "from: ${currency.fromCurrency}",
        ),
        Text("to: ${currency.toCurrency}"),
        Text("result: ${currency.result}"),
      ],
    ));
  }
}
