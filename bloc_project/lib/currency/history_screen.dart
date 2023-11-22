import 'package:bloc_project/bloc/currecny_bloc/currency_bloc.dart';
import 'package:bloc_project/data/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: historyList.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                        "${historyList[index].from} to ${historyList[index].to}")
                  ],
                ),
                subtitle: Text(
                    "${historyList[index].fromAmount} to ${historyList[index].toAmount}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
