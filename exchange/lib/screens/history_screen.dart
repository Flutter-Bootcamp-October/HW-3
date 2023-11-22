import 'package:exchange/bloc/currency_bloc.dart';
import 'package:exchange/screens/home_screen.dart';
import 'package:exchange/widgets/dipaly_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // You can adjust the number of columns here
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: exchangeList.length,
            itemBuilder: (context, index) {
              return DispalyExchange(exchange: exchangeList[index]);
            },
          );
        },
      ),
    );
  }
}
