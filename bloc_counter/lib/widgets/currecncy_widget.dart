import 'package:bloc_counter/models/currenc_card.dart';
import 'package:flutter/material.dart';

class CurrencyWidget extends StatelessWidget {
  const CurrencyWidget({super.key, required this.current});
  final CurrencyCard current;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      Text(" ${current.fromAmount} --> ${current.toAmount} "),
      Text("from ${current.fromCurrency} to ${current.toCureency} ")
    ]));
  }
}
