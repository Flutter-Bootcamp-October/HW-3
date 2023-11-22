import 'package:bloc_counter/global/globals.dart';
import 'package:bloc_counter/widgets/currecncy_widget.dart';
import 'package:flutter/material.dart';

class ConversionHistory extends StatelessWidget {
  const ConversionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Conversion Hisory"),
        ),
        body: ListView(
            children: List.generate(conversionsHisory.length,
                (index) => CurrencyWidget(current: conversionsHisory[index]))));
  }
}
